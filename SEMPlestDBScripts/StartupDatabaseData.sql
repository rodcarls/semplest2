- - r o l e s    
 i n s e r t   i n t o   d b o . r o l e s   ( r o l e n a m e )   v a l u e s   ( ' C u s t o m e r   ( c h i l d ) ' )  
 i n s e r t   i n t o   d b o . r o l e s   ( r o l e n a m e )   v a l u e s   ( ' C u s t o m e r   ( p a r e n t ) ' )  
 i n s e r t   i n t o   d b o . r o l e s   ( r o l e n a m e )   v a l u e s   ( ' A c c o u n t   R e p r e s e n t a t i v e   ( R e p ) ' )  
 i n s e r t   i n t o   d b o . r o l e s   ( r o l e n a m e )   v a l u e s   ( ' S a l e s p e r s o n ' )  
 i n s e r t   i n t o   d b o . r o l e s   ( r o l e n a m e )   v a l u e s   ( ' F i n a n c e   U s e r ' )  
 i n s e r t   i n t o   d b o . r o l e s   ( r o l e n a m e )   v a l u e s   ( ' S u p e r   U s e r   ( A d m i n ) ' )  
 i n s e r t   i n t o   d b o . r o l e s   ( r o l e n a m e )   v a l u e s   ( ' S y s t e m ' )  
  
 - - s c h e d u l e r    
 i n s e r t   i n t o   F r e q u e n c y ( F r e q u e n c y )   v a l u e s   ( ' N o w ' )  
 i n s e r t   i n t o   F r e q u e n c y ( F r e q u e n c y )   v a l u e s   ( ' D a i l y ' )  
 i n s e r t   i n t o   F r e q u e n c y ( F r e q u e n c y )   v a l u e s   ( ' W e e k l y ' )  
 i n s e r t   i n t o   F r e q u e n c y ( F r e q u e n c y )   v a l u e s   ( ' M o n t h l y ' )  
 i n s e r t   i n t o   F r e q u e n c y ( F r e q u e n c y )   v a l u e s   ( ' T e n M i n u t e s ' )  
 - - A d   E n g i n e s  
 I n s e r t   i n t o   A d v e r t i s i n g E n g i n e ( A d v e r t i s i n g E n g i n e )   V A L U E S   ( ' M S N ' )  
 I n s e r t   i n t o   A d v e r t i s i n g E n g i n e ( A d v e r t i s i n g E n g i n e )   V A L U E S   ( ' G o o g l e ' )  
 - - K e y w o r d   M a t c h   T y p e  
 i n s e r t   i n t o   B i d T y p e ( B i d T y p e )   v a l u e s   ( ' B r o a d ' )  
 i n s e r t   i n t o   B i d T y p e ( B i d T y p e )   v a l u e s   ( ' E x a c t ' )  
 i n s e r t   i n t o   B i d T y p e ( B i d T y p e )   v a l u e s   ( ' P h r a s e ' )  
 - - B u d g e t   c y c l e  
 i n s e r t   i n t o   B u d g e t C y c l e ( B u d g e t C y c l e )   v a l u e s   ( ' D a i l y ' )  
 i n s e r t   i n t o   B u d g e t C y c l e ( B u d g e t C y c l e )   v a l u e s   ( ' W e e k l y ' )  
 i n s e r t   i n t o   B u d g e t C y c l e ( B u d g e t C y c l e )   v a l u e s   ( ' M o n t h l y ' )  
 i n s e r t   i n t o   B u d g e t C y c l e ( B u d g e t C y c l e )   v a l u e s   ( ' Y e a r l y ' )  
 - - B i l l i n g   T y p e s  
 i n s e r t   i n t o   B i l l T y p e ( B i l l T y p e )   v a l u e s   ( ' N o   B i l l ' )  
 i n s e r t   i n t o   B i l l T y p e ( B i l l T y p e )   v a l u e s   ( ' C r e d i t   C a r d ' )  
 i n s e r t   i n t o   B i l l T y p e ( B i l l T y p e )   v a l u e s   ( ' I n v o i c e ' )  
  
 - - s t a t e s  
  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ S t a t e C o d e ]         S c r i p t   D a t e :   0 5 / 0 8 / 2 0 1 2   1 8 : 0 4 : 1 0   * * * * * * /  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ S t a t e C o d e ]   O N  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 ,   N ' A L ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 ,   N ' A K ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 ,   N ' A Z ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 ,   N ' A R ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 5 ,   N ' C A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 6 ,   N ' C O ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 7 ,   N ' C T ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 8 ,   N ' D E ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 9 ,   N ' F L ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 0 ,   N ' G A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 1 ,   N ' H I ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 2 ,   N ' I D ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 3 ,   N ' I L ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 4 ,   N ' I N ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 5 ,   N ' I A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 6 ,   N ' K S ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 7 ,   N ' K Y ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 8 ,   N ' L A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 1 9 ,   N ' M E ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 0 ,   N ' M D ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 1 ,   N ' M A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 2 ,   N ' M I ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 3 ,   N ' M N ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 4 ,   N ' M S ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 5 ,   N ' M O ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 6 ,   N ' M T ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 7 ,   N ' N E ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 8 ,   N ' N V ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 2 9 ,   N ' N H ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 0 ,   N ' N J ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 1 ,   N ' N M ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 2 ,   N ' N Y ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 3 ,   N ' N C ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 4 ,   N ' N D ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 5 ,   N ' O H ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 6 ,   N ' O K ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 7 ,   N ' O R ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 8 ,   N ' P A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 3 9 ,   N ' R I ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 0 ,   N ' S C ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 1 ,   N ' S D ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 2 ,   N ' T N ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 3 ,   N ' T X ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 4 ,   N ' U T ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 5 ,   N ' V T ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 6 ,   N ' V A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 7 ,   N ' W A ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 8 ,   N ' W V ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 4 9 ,   N ' W I ' )  
 I N S E R T   [ d b o ] . [ S t a t e C o d e ]   ( [ S t a t e A b b r P K ] ,   [ S t a t e A b b r ] )   V A L U E S   ( 5 0 ,   N ' W Y ' )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ S t a t e C o d e ]   O F F  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ P h o n e T y p e ]         S c r i p t   D a t e :   0 5 / 0 8 / 2 0 1 2   1 8 : 0 4 : 1 0   * * * * * * /  
 I N S E R T   [ d b o ] . [ P h o n e T y p e ]   ( [ P h o n e T y p e P K ] ,   [ P h o n e T y p e ] )   V A L U E S   ( 1 ,   N ' B u s i n e s s ' )  
 G O  
  
  
 i n s e r t   i n t o   [ A d d r e s s T y p e ]   ( A d d r e s s T y p e )   v a l u e s   ( ' H ' )  
 G O  
 - - - P r o d u c t G r o u p C y c l e T y p e  
 I N S E R T   I N T O   P r o d u c t G r o u p C y c l e T y p e   ( P r o d u c t G r o u p C y c l e T y p e ,   C y c l e I n D a y s )   V A L U E S   ( ' P r o d u c t   G r o u p   C y c l e   3 0 '   , 3 0 )  
 I N S E R T   I N T O   P r o d u c t G r o u p C y c l e T y p e   ( P r o d u c t G r o u p C y c l e T y p e ,   C y c l e I n D a y s )   V A L U E S   ( ' P r o d u c t   G r o u p   C y c l e   7 '   , 7 )  
 I N S E R T   I N T O   P r o d u c t G r o u p C y c l e T y p e   ( P r o d u c t G r o u p C y c l e T y p e ,   C y c l e I n D a y s )   V A L U E S   ( ' P r o d u c t   G r o u p   C y c l e   3 6 5 '   , 3 6 5 )  
  
 - - C o n f i g  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ C o n f i g u r a t i o n ]  
                       ( [ C u s t o m e r M i n O r d e r A m o u n t ] ,  
                       [ C u s t o m e r D e f a u l t M o n t h l y F l a t F e e A m o u n t ] ,  
                       [ C u s t o m e r D e f a u l t P e r C a m p a i g n F l a t F e e A m o u n t ] ,  
                       [ C u s t o m e r D e f a u l t P e r A d G r o u p F l a t F e e A m o u n t ] ,  
                       [ D e f a u l t M e d i a C o m i s s i o n P e r c e n t a g e ] ,  
                       [ D e f a u l t S a l e s P e r s o n C o m m i s s i o n P e r c e n t a g e ] ,  
                       [ M i n S a l e s p e r s o n C o m m i s s i o n P e r c e n t a g e ] )  
           V A L U E S  
                       ( 2 5 , 7 5 , 1 7 . 5 , 1 2 . 7 5 , 4 . 1 3 , 0 , 0 )  
 u p d a t e   C o n f i g u r a t i o n    
 	 	 	 	 	 s e t   M S N C a m p a i g n U R L   =   ' h t t p s : / / a d c e n t e r a p i . m i c r o s o f t . c o m / A p i / A d v e r t i s e r / v 8 / C a m p a i g n M a n a g e m e n t / C a m p a i g n M a n a g e m e n t S e r v i c e . s v c ? w s d l '   ,  
 	 	 	 	 	 M S N C a m p a g n N a m e s p a c e   =   ' h t t p s : / / a d c e n t e r . m i c r o s o f t . c o m / v 8 ' ,  
 	 	 	 	 	 M S N C u s t o m e r U R L   = ' h t t p s : / / s h a r e d s e r v i c e s . a d c e n t e r a p i . m i c r o s o f t . c o m / A p i / C u s t o m e r M a n a g e m e n t / v 8 / C u s t o m e r M a n a g e m e n t S e r v i c e . s v c ? w s d l ' ,  
 	 	 	 	 	 M S N C u s t o m e r N a m e s p a c e   =   ' h t t p s : / / a d c e n t e r . m i c r o s o f t . c o m / a p i / c u s t o m e r m a n a g e m e n t ' ,  
 	 	 	 	 	 M S N R e p o r t i n g U R L   =   ' h t t p s : / / a d c e n t e r a p i . m i c r o s o f t . c o m / A p i / A d v e r t i s e r / v 8 / R e p o r t i n g / R e p o r t i n g S e r v i c e . s v c ? w s d l ' ,  
 	 	 	 	 	 M S N R e p o r t i n g N a m e s p a c e   =   ' h t t p s : / / a d c e n t e r . m i c r o s o f t . c o m / v 8 ' ,  
 	 	 	 	 	 M S N A d I n t e l l i g e n c e U R L   =   ' h t t p s : / / a d c e n t e r a p i . m i c r o s o f t . c o m / A p i / A d v e r t i s e r / v 8 / C a m p a i g n M a n a g e m e n t / A d I n t e l l i g e n c e S e r v i c e . s v c ? w s d l ' ,  
 	 	 	 	 	 M S N A d I n t e l l i g e n c e N a m e s p a c e   =   ' h t t p s : / / a d c e n t e r . m i c r o s o f t . c o m / v 8 ' ,  
 	 	 	 	 	 M S N P a r e n t C u s t o m e r I D   =   6 9 4 1 2 2 ,  
 	 	 	 	 	 M S N A p i U s e r n a m e   =   ' A P I _ S E M p l e s t ' ,  
 	 	 	 	 	 M S N A p i P a s s w o r d   =   ' 1 s 3 m p l 3 s t ' ,  
 	 	 	 	 	 M S N U s e r A c c e s s K e y   =   ' 6 L T W 1 J C M E K I U X 3 ' ,  
 	 	 	 	 	  
 	 	 	 	 	 A d w o r d s E m a i l   =   ' a d w o r d s @ s e m p l e s t . c o m ' ,  
 	 	 	 	 	 A d w o r d s P a s s w o r d   =   ' 7 y l Z J T l h u C G 4 l o T C 6 Q l l r w = = ' ,    
 	 	 	 	 	 A d w o r d s U s e r A g e n t =   ' I c o s y s t e m ' ,  
 	 	 	 	 	 A d w o r d s D e v e l o p e r T o k e n   =   ' 2 H 8 l 6 a U m 6 K _ Q 4 4 v D v x s 3 O g ' ,  
 	 	 	 	 	 A d w o r d s U s e S a n d b o x   =   1 ,    
 	 	 	 	 	  
 	 	 	 	 	 O r b i t a l G a t e w a y S a l e m P l a t f o r m   =   ' 0 0 0 0 0 1 ' ,  
 	 	 	 	 	 O r b i t a l G a t e w a y M e r c h a n t I D   =   ' 0 4 1 7 5 6 ' ,  
 	 	 	 	 	 O r b i t a l G a t e w a y U s e r n a m e   =   ' T S E M P L E S T 0 1 ' ,  
 	 	 	 	 	 O r b i t a l G a t e w a y P a s s w o r d   =   ' Z i S s s E l t P o U 1 9 a K z 5 k g Z U g = = ' ,  
 	 	 	 	 	  
 	 	 	 	 	 S e m p l e s t C l i e n t A d w o r d s T i m e o u t M S   =   2 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t C l i e n t K e y w o r d T i m e o u t M S   =   4 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t C l i e n t M S N T i m e o u t M S   =   2 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t C l i e n t B i d d i n g T i m e o u t M S   =   1 2 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t C l i e n t M a i l T i m e o u t M S   =   5 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t C l i e n t S c h e d u l e r T i m e o u t M S   =   5 0 0 0 ,  
 	 	 	 	 	  
 	 	 	 	 	 S e m p l e s t B i d d i n g M a x R e t r y   =   1 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g S l e e p P e r i o d   =   5 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g S l e e p B a c k O f f T i m e   =   1 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g M a x M i c r o B i d   =   3 0 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g S t e p A b o v e F p C P C   =   5 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g D e f a u l t M i c r o B i d   =   1 0 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g M a x D e f a u l t M i c r o B i d   =   1 5 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g S t e p F i r s t   =   1 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g S t e p S e c o n d   =     6 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g S t e p R e s t   =     8 0 0 0 0 0 ,  
 	 	 	 	 	 S e m p l e s t B i d d i n g G o o g l e P e r c e n t   =   7 0 ,  
 	 	 	 	 	  
 	 	 	 	 	 E S B R e g S e r v i c e P o r t   =   9 9 9 9 ,  
 	 	 	 	 	 E S B B r o k e r N a m e   =   ' S E M p l e s t M Q ' ,  
 	 	 	 	 	 E S B B r o k e r P o r t   =   6 1 6 1 6 ,  
 	 	 	 	 	 E S B B r o k e r I P   =   ' V M D E V J A V A 1 ' ,  
 	 	 	 	 	 E S B W e b S e r v e r P o r t   =   9 8 9 8 ,  
 	 	 	 	 	 E S B W e b S e r v e r U R L   =   ' h t t p : / / V M D E V J A V A 1 : 9 8 9 8 / s e m p l e s t ' ,  
 	 	 	 	 	 E S B H e a d e r B u f f e r S i z e   =   5 1 2 0 0 0 ,  
 	 	 	 	 	 E S B A s y n c h S e r v l e t C o r e P o o l S i z e   =   1 0 ,  
 	 	 	 	 	 E S B A s y n c h S e r v l e t M a x P o o l S i z e   =   1 0 0 ,  
 	 	 	 	 	 E S B A s y n c h C a l l D e f a u l t T i m e o u t M S   =   1 0 0 0 0 ,  
 	 	 	 	 	  
 	 	 	 	 	 S e r v i c e E S B S e r v e r P o r t   =   9 9 9 9 ,  
 	 	 	 	 	 S e r v i c e E S B S e r v e r I P   =   ' V M D E V J A V A 1 ' ,  
 	 	 	 	 	 S e r v i c e P i n g F r e q u e n c y M S   =   1 0 0 0 0 ,  
 	 	 	 	 	 S e r v i c e N u m b e r S e r v i c e T h r e a d s   =   1 5 ,  
 	 	 	 	 	 S e r v i c e S M T P   =   ' V M D E V J A V A 2 ' ,  
 	 	 	 	 	  
 	 	 	 	 	 S e m p l e s t E n c r y p t i o n k e y   =   ' 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 4 4 '  
  
 	 	 	 	 w h e r e   C o n f i g u r a t i o n P K   =   1  
  
  
 	 	 	 	  
 - - a d d   f i r s t   a d m i n   u s e r  
  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ U s e r s ]   O N  
 I N S E R T   [ d b o ] . [ U s e r s ]   ( [ U s e r P K ] ,   [ C u s t o m e r F K ] ,   [ F i r s t N a m e ] ,   [ L a s t N a m e ] ,   [ E m a i l ] ,   [ C r e a t e d D a t e ] ,   [ E d i t e d D a t e ] ,   [ I s A c t i v e ] ,   [ M i d d l e I n i t i a l ] ,   [ I s R e g i s t e r e d ] )   V A L U E S   ( 1 ,   N U L L ,   N ' M a r k ' ,   N ' K e l l e y ' ,   N ' m k @ r r e . c o m ' ,   C A S T ( 0 x 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0   A S   D a t e T i m e 2 ) ,   N U L L ,   1 ,   N ' x ' ,   1 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ U s e r s ]   O F F  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ E m p l o y e e ]   O N  
 I N S E R T   [ d b o ] . [ E m p l o y e e ]   ( [ E m p l o y e e P K ] ,   [ E m p l o y e e T y p e F K ] ,   [ U s e r s F K ] ,   [ R e p o r t i n g T o ] ,   [ H i r e D a t e ] )   V A L U E S   ( 1 ,   4 ,   1 ,   N U L L ,   C A S T ( 0 x 0 7 0 0 0 0 0 0 0 0 0 0 A 6 3 5 0 B   A S   D a t e T i m e 2 ) )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ E m p l o y e e ]   O F F  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ C r e d e n t i a l ]   O N  
 I N S E R T   [ d b o ] . [ C r e d e n t i a l ]   ( [ C r e d e n t i a l P K ] ,   [ U s e r s F K ] ,   [ U s e r n a m e ] ,   [ P a s s w o r d ] ,   [ R e m e m b e r M e ] ,   [ S e c u r i t y Q u e s t i o n ] ,   [ S e c u r i t y A n s w e r ] )   V A L U E S   ( 1 ,   1 ,   N ' m a r k k e l l e y ' ,   N ' m a r k k e l l e y ' ,   0 ,   N U L L ,   N U L L )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ C r e d e n t i a l ]   O F F  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ U s e r R o l e s A s s o c i a t i o n ]   O N  
 I N S E R T   [ d b o ] . [ U s e r R o l e s A s s o c i a t i o n ]   ( [ U s e r R o l e s A s s o c i a t i o n P K ] ,   [ U s e r s F K ] ,   [ R o l e s F K ] )   V A L U E S   ( 1 ,   1 ,   6 )  
 S E T   I D E N T I T Y _ I N S E R T   [ d b o ] . [ U s e r R o l e s A s s o c i a t i o n ]   O F F  
  
  
  
 - -   E m a i l   T y p e s  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T y p e ]   ( [ E m a i l T y p e ] )   V A L U E S   ( ' C h a n g e P a s s w o r d ' )  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T y p e ]   ( [ E m a i l T y p e ] )   V A L U E S   ( ' C r e d i t C a r d D e c l i n e d ' )  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T y p e ]   ( [ E m a i l T y p e ] )   V A L U E S   ( ' E x p i r e d A c t i v a t i o n I d s ' )  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T y p e ]   ( [ E m a i l T y p e ] )   V A L U E S   ( ' F o r g o t t e n P a s s w o r d ' )  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T y p e ]   ( [ E m a i l T y p e ] )   V A L U E S   ( ' P r o m o t i o n N o t S t a r t e d ' )  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T y p e ]   ( [ E m a i l T y p e ] )   V A L U E S   ( ' W e l c o m e E m a i l C h i l d ' )  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T y p e ]   ( [ E m a i l T y p e ] )   V A L U E S   ( ' W e l c o m e E m a i l P a r e n t ' )  
  
  
 - - E m a i l T e m p l a t e s  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T e m p l a t e ]   ( [ C u s t o m e r F K ] , [ E m a i l S u b j e c t ] , [ E m a i l B o d y ] , [ E m a i l F r o m ] , [ E m a i l T y p e F K ] )   V A L U E S  
                 ( 2 ,  
                 ' Y o u r   N e w   S E M p l e s t   P a s s w o r d ' ,  
                 ' D e a r   [ V e n d o r N a m e ] , < b r > < b r > O u r   r e c o r d s   s h o w   y o u r   p a s s w o r d   t o   S E M p l e s t   h a s   b e e n   c h a n g e d .   I f   y o u   d i d   n o t   c h a n g e   y o u r   p a s s w o r d ,   p l e a s e   c o n t a c t   u s   a t   [ h e l p @ s e m p l e s t . c o m ] . < b r > < b r > T h a n k   y o u ! < b r > S E M p l e s t ' ,  
 	 	 ' h e l p @ s e m p l e s t . c o m ' ,  
 	 	 1 ) 	                        
  
  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T e m p l a t e ]   ( [ C u s t o m e r F K ] , [ E m a i l S u b j e c t ] , [ E m a i l B o d y ] , [ E m a i l F r o m ] , [ E m a i l T y p e F K ] )   V A L U E S  
                 ( 2 ,  
                 ' Y o u r   S E M p l e s t   A c c o u n t   h a s   b e e n   P a u s e d ' ,  
                 ' D e a r   [ V e n d o r N a m e ] , < b r > < b r > O u r   r e c o r d s   s h o w   t h e   c r e d i t   c a r d   o n   f i l e   n e e d s   t o   b e   u p d a t e d   i n   o r d e r   f o r   y o u r   a d s   t o   r e m a i n   a c t i v e . < b r > < b r > P l e a s e   l o g   i n t o   y o u r   S E M p l e s t   a c c o u n t   t o   u p d a t e   y o u r   b i l l i n g   i n f o r m a t i o n   o r   c o n t a c t   u s   a t   [ h e l p @ s e m p l e s t . c o m ] . < b r > < b r > [ S E M P L E S T   L I N K ] < b r > < b r > T h a n k   y o u ! < b r > S E M p l e s t ' ,  
 	 	 ' h e l p @ s e m p l e s t . c o m ' ,  
 	 	 2 ) 	                            
      
  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T e m p l a t e ]   ( [ C u s t o m e r F K ] , [ E m a i l S u b j e c t ] , [ E m a i l B o d y ] , [ E m a i l F r o m ] , [ E m a i l T y p e F K ] )   V A L U E S  
                 ( 2 ,  
                 ' E x p i r e d   S E M p l e s t   P a s s w o r d ' ,  
                 ' D e a r   [ V e n d o r N a m e ] , < b r > < b r > D u e   t o   i n a c t i v i t y   u s i n g   t h e   S E M p l e s t   t o o l ,   y o u r   u s e r   n a m e   a n d   p a s s w o r d   h a v e   e x p i r e d .   B e l o w   y o u   w i l l   f i n d   u p d a t e d   a c c o u n t   i n f o r m a t i o n .   P l e a s e   n o t e ,   t h e s e   a c t i v a t i o n   I D s   w i l l   e x p i r e   i n   [ X X ]   d a y s . < b r > < b r > U s e r   N a m e :   [ x x x x x x ] < b r > P a s s w o r d :   [ x x x x x ] < b r > < b r > [ S E M P L E S T   L I N K ] < b r > < b r > I f   y o u   n e e d   a n y   a s s i s t a n c e ,   p l e a s e   r e a c h   o u t   t o   u s   a t   [ h e l p @ s e m p l e s t . c o m ] . < b r > < b r > T h a n k   y o u ! < b r > S E M p l e s t ' ,  
 	 	 ' h e l p @ s e m p l e s t . c o m ' ,  
 	 	 3 ) 	        
  
  
  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T e m p l a t e ]   ( [ C u s t o m e r F K ] , [ E m a i l S u b j e c t ] , [ E m a i l B o d y ] , [ E m a i l F r o m ] , [ E m a i l T y p e F K ] )   V A L U E S  
                 ( 2 ,  
                 ' Y o u r   N e w   S E M p l e s t   P a s s w o r d ' ,  
                 ' D e a r   [ V e n d o r N a m e ] , < b r > < b r > B e l o w   p l e a s e   f i n d   t h e   t e m p o r a r y   p a s s w o r d   t o   a c c e s s   y o u r   S E M p l e s t   a c c o u n t .   Y o u r   u s e r   i d   h a s   n o t   c h a n g e d .   Y o u   w i l l   b e   p r o m p t e d   t o   c h a n g e   y o u r   p a s s w o r d   a f t e r   l o g g i n g   i n . < b r > < b r > P a s s w o r d :   [ x x x x x ] < b r > < b r > [ S E M P L E S T   L I N K ] < b r > < b r > I f   y o u   n e e d   a n y   a s s i s t a n c e ,   p l e a s e   r e a c h   o u t   t o   u s   a t   [ h e l p @ s e m p l e s t . c o m ] . < b r > < b r > T h a n k   y o u ! < b r > S E M p l e s t ' ,  
 	 	 ' h e l p @ s e m p l e s t . c o m ' ,  
 	 	 4 )  
 	 	  
 	 	  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T e m p l a t e ]   ( [ C u s t o m e r F K ] , [ E m a i l S u b j e c t ] , [ E m a i l B o d y ] , [ E m a i l F r o m ] , [ E m a i l T y p e F K ] )   V A L U E S  
                 ( 2 ,  
                 ' L e t   S E M p l e s t   m a n a g e   y o u r   s e a r c h   m a r k e t i n g ! ' ,  
                 ' D e a r   [ V e n d o r N a m e ] < b r > < b r > W e   n o t i c e d   y o u   h a v e n  t   c r e a t e d   a n y   s e a r c h   a d s   u s i n g   S E M p l e s t . < b r > < b r > C r e a t i n g   a   p r o m o t i o n   i s   f a s t ,   e a s y   a n d   c o s t   e f f e c t i v e .   I f   y o u   n e e d   a s s i s t a n c e   g e t t i n g   s t a r t e d ,   p l e a s e   c o n t a c t   u s   a t   [ h e l p @ s e m p l e s t . c o m ]   o r   l o g   i n t o   [ S E M p l e s t   L i n k ]   a n d   l e t   u s   d o   t h e   h e a v y   l i f t i n g !   W e  l l   h a v e   y o u r   p r o m o t i o n s   l i v e   o n   G o o g l e ,   B i n g   a n d   Y a h o o !   i n   n o   t i m e . < b r > < b r > W a n t   t o   l e a r n   m o r e ?   R e a d   o u r   [ F A Q s ]   o r   [ A b o u t   U s ] . < b r > < b r > W e   l o o k   f o r w a r d   t o   s h o w i n g   y o u   h o w   e f f e c t i v e   a n d   e f f i c i e n t   S E M p l e s t   m a k e s   s e a r c h   e n g i n e   m a r k e t i n g ! < b r > < b r > B e s t , < b r > < b r > T h e   S E M p l e s t   T e a m ' ,  
 	 	 ' h e l p @ s e m p l e s t . c o m ' ,  
 	 	 5 )  
 	 	  
 	 	  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T e m p l a t e ]   ( [ C u s t o m e r F K ] , [ E m a i l S u b j e c t ] , [ E m a i l B o d y ] , [ E m a i l F r o m ] , [ E m a i l T y p e F K ] )   V A L U E S  
                 ( 2 ,  
                 ' H o w   t o   r e a c h   t h e   r i g h t   a u d i e n c e   a n d   i n c r e a s e   v i s i t s   t o   y o u r   w e b s i t e  e f f o r t l e s s l y ! ' ,  
                 ' D e a r   [ V e n d o r N a m e ] < b r > < b r > I n t e r e s t e d   i n   r e a c h i n g   y o u r   t a r g e t   a u d i e n c e   t h r o u g h   s e a r c h   e n g i n e   m a r k e t i n g ,   b u t   n o t   s u r e   h o w   t o   g e t   s t a r t e d ? < b r > < b r > A l r e a d y   h a v e   a   s e a r c h   p r o g r a m   a n d   w a n t   t o   s a v e   t i m e   a n d   m o n e y ? < b r > < b r > N o   w o r r i e s !     [ A l l s t a t e ]   n o w   o f f e r s   a n   e a s y - t o - u s e   s e a r c h   m a r k e t i n g   t o o l   t o   h e l p   y o u   g e t   t h e   m o s t   o u t   o f   y o u r   a d v e r t i s i n g   - -   t h r o u g h   s e a r c h   e n g i n e   m a r k e t i n g   o n   G o o g l e ,   B i n g   a n d   Y a h o o ! . < b r > < b r > Y o u  r e   i n v i t e d   t o   t r y   o u t   [ A l l s t a t e   S e a r c h ]   - -   o u r   i n t u i t i v e   t o o l   f o r   s m a l l   b u s i n e s s e s   t o   c r e a t e   s e a r c h   e n g i n e   m a r k e t i n g   c a m p a i g n s   e f f e c t i v e l y   a n d   e f f i c i e n t l y . < b r > < b r > I t   l e t s   y o u : < u l > < l i > D i s c o v e r   h u n d r e d s   o f   p e r s o n a l i z e d   k e y w o r d s   f o r   a l l   o f   y o u r   b u s i n e s s   p r o d u c t s . < l i > L a u n c h   a   s e a r c h   c a m p a i g n   i n   j u s t   t h r e e   e a s y   s t e p s . < l i > S i t   b a c k   a n d   r e l a x      i t   a u t o m a t e s   t h e   o n g o i n g   m a n a g e m e n t   o f   y o u r   c a m p a i g n s . < / u l > < b r > < b r > W a n t   t o   l e a r n   m o r e ?   R e a d   o u r   [ F A Q s ] . < b r > < b r > R e a d y   t o   g e t   s t a r t e d ?   G o   t o   [ I N S E R T   L I N K ]   a n d   u s e   t h e   f o l l o w i n g   l o g   i n   i n f o r m a t i o n : < b r > < b r > U s e r   N a m e :   [ x x x x x x ] < b r > P a s s w o r d :   [ x x x x x ] < b r > < b r > W i t h   [ A l l s t a t e ] ,   i t  s   t h a t   e a s y ! ' ,  
 	 	 ' h e l p @ s e m p l e s t . c o m ' ,  
 	 	 6 )  
 	 	  
 	 	  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ E m a i l T e m p l a t e ]   ( [ C u s t o m e r F K ] , [ E m a i l S u b j e c t ] , [ E m a i l B o d y ] , [ E m a i l F r o m ] , [ E m a i l T y p e F K ] )   V A L U E S  
                 ( 2 ,  
                 ' W e l c o m e   t o   S E M p l e s t !   A c c o u n t   D e t a i l s   I n s i d e ' ,  
                 ' D e a r   [ V e n d o r N a m e ] < b r > < b r > T h a n k   y o u   f o r   c h o o s i n g   S E M p l e s t   t o   e f f o r t l e s s l y   m a n a g e   y o u r   s e a r c h   m a r k e t i n g   n e e d s ! < b r > < b r > T o   i n i t i a t e   y o u r   a c c o u n t   a n d   i n v i t e   [ A l l s t a t e   a g e n t s ]   t o   u s e   t h e   t o o l ,   g o   t o   [ I N S E R T   L I N K ]   a n d   e n t e r   t h e   f o l l o w i n g   l o g   i n   i n f o r m a t i o n : < b r > < b r > U s e r   N a m e :   [ x x x x x x ] < b r > P a s s w o r d :   [ x x x x x ] < b r > < b r > I f   y o u   n e e d   a n y   a s s i s t a n c e ,   p l e a s e   r e a c h   o u t   t o   u s   a t   [ h e l p @ s e m p l e s t . c o m ] . < b r > < b r > W e   l o o k   f o r w a r d   t o   s h o w i n g   y o u   h o w   e f f e c t i v e   a n d   e f f i c i e n t   S E M p l e s t   m a k e s   s e a r c h   e n g i n e   m a r k e t i n g ! < b r > < b r > T h a n k   y o u ! [ S E M p l e s t   ( O R   R E P   N A M E ) ] ' ,  
 	 	 ' [ s a l e s r e p e m a i l a d d r e s s ] ' ,  
 	 	 7 ) 