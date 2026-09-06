import emblemWhite from '../assets/emblem-white.png';
import emblemDark from '../assets/emblem-dark.png';
import emblemGold from '../assets/emblem-gold.png';

export default function Emblem({ size = 48, className = '', light = false, variant, style = {} }) {
  // Determine variant: default to 'white' if light={true}, else 'dark', or explicit variant
  const selectedVariant = variant || (light ? 'white' : 'dark');
  
  let src = emblemDark;
  if (selectedVariant === 'white') src = emblemWhite;
  else if (selectedVariant === 'gold') src = emblemGold;

  // Aspect ratio of the official emblem is 500 : 797 (~ 1 : 1.594)
  const width = Math.round(size * (500 / 797));

  return (
    <div 
      className={`inline-flex items-center justify-center select-none shrink-0 ${className}`} 
      style={{ ...style }}
    >
      <img
        src={src}
        alt="State Emblem of India — Satyameva Jayate"
        width={width}
        height={size}
        style={{
          height: `${size}px`,
          width: 'auto',
          maxHeight: `${size}px`,
          objectFit: 'contain',
        }}
        className="transition-transform duration-200"
        loading="eager"
        decoding="async"
        draggable={false}
      />
    </div>
  );
}
