module lang::marvol::Marvol

extend lang::std::Whitespace;
extend lang::std::Layout;
extend lang::std::Comment;

start syntax Program = Definition* defs Dance main; 

syntax Definition = "def" Id name "=" Dance dance;

lexical Speech = "\"" ![\n\r\"]* text "\"";

syntax Dance
  = Part Move+ ";"
  | "repeat" Nat Dance
  | "backforth" Nat Dance
  | @Foldable "{" Dance* "}"
  | @Foldable "{|" Dance* "|}" 
  | "mirror" Dance
  | @category="Identifier" call: Id name ";"
  | "nop" ";"
  | "say" Speech speech ";"?
  ;

syntax Part
  = "arm"
  | "legs"
  | "elbow"
  | "hand"
  | "chin"
  | "look"
  | "arms"
  | "elbows"
  | "hands"
  ;
  
syntax Move
  = @category="Constant" "up"
  | @category="Constant" "down"
  | @category="Constant" "twist"
  | @category="Constant" "bend"
  | @category="Constant" "stretch"
  | @category="Constant" "close"
  | @category="Constant" "open"
  | @category="Constant" "far"
  | @category="Constant" "forwards"
  | @category="Constant" "sideways"
  | @category="Constant" "inwards"
  | @category="Constant" "outwards"
  | @category="Constant" "left"
  | @category="Constant" "right"
  | @category="Constant" "forward"
  | @category="Constant" "squat" 
  | @category="Constant" "hawaii" 
  | @category="Constant" "luckyluke" 
  ;

keyword Reserved 
	= "repeat" | "backforth" | "mirror" | "nop"
	;

keyword Reserved 
	= "arm" | "legs" | "elbow" | "hand" | "chin" | "look" | "arms" | "elbows" | "hands" 
	;
	
keyword Reserved 
	= "up" | "down" | "twist" | "bend" | "stretch" | "close" |  "open" |  "far" 
	| "forwards" | "sideways" | "inwards" | "outwards" | "left" | "right" | "forward" | "squat" 
 	| "hawaii" | "luckyluke";

lexical Id = ([a-zA-Z_] !<< [a-zA-Z_][a-zA-Z0-9_]* !>> [a-zA-Z0-9_]) \ Reserved;

lexical Nat = [0-9]+ !>> [0-9];
