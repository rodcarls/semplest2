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
 	 	 7 )  
 	 	  
 - - W e b   C o n t e n t 	 	  
 I N S E R T   I N T O   [ s e m p l e s t ] . [ d b o ] . [ W e b C o n t e n t ]  
  
 ( [ F A Q ] , [ A b o u t U s ] )   V a l u e s  
 ( ' < o l >  
 < l i > < p > < b > W h a t   i s   S E M ? < / b > < b r > S E M   i s   S e a r c h   E n g i n e   M a r k e t i n g .   S e a r c h   E n g i n e   M a r k e t i n g   i s   a   f o r m   o f   I n t e r n e t   m a r k e t i n g   t h a t   p r o m o t e s   w e b s i t e s   b y   i n c r e a s i n g   v i s i b i l i t y   i n   s e a r c h   e n g i n e   r e s u l t s .   I t   i s   s o m e t i m e s   r e f e r r e d   t o   a s   P a y   P e r   C l i c k   ( P P C )   a d v e r t i s i n g   s i n c e   y o u   o n l y   p a y   w h e n   a   u s e r   c l i c k s   o n   y o u r   a d . < / p > < / l i >  
 < l i > < p > < b > W h a t   a r e   S E M   a d s ? < / b > < b r > S E M   a d s   a r e   s h o r t ,   t e x t - b a s e d   a d s   t h a t   a p p e a r   a b o v e   a n d / o r   t o   t h e   s i d e   o f   t h e   n a t u r a l   ( u n p a i d )   s e a r c h   r e s u l t s . < / p > < / l i >  
 < l i > < p > < b > W h a t   i s   t h e   S E M p l e s t   t o o l ? < / b > < b r > T h e   S E M p l e s t   t o o l   i s   a   s i m p l e ,   i n t u i t i v e ,   w e l l   d e s i g n e d   t o o l   f o r   b u s i n e s s e s   t o   c r e a t e   S E M   c a m p a i g n s   e f f e c t i v e l y   a n d   e f f i c i e n t l y .     T h i s   t o o l   h e l p s   b u s i n e s s e s   s e a m l e s s l y   m a n a g e   h u n d r e d s   o f   k e y w o r d s   f o r   m u l t i p l e   p r o d u c t s   a n d   s e r v i c e s ,   w i t h   m u l t i p l e   a u d i e n c e   t a r g e t s   a c r o s s   m u l t i p l e   s e a r c h   e n g i n e s .   S E M p l e s t   u s e s   a r t i f i c i a l   i n t e l l i g e n c e   t o   a u t o m a t e   t h e   o p t i m i z a t i o n   o f   S E M   c a m p a i g n s .   W e   d o   t h e   h e a v y   l i f t i n g   f o r   y o u . < / p > < / l i >  
 < l i > < p > < b > H o w   d o e s   S E M p l e s t   w o r k ? < / b > < b r > B a s e d   o n   s o m e   b a s i c   i n f o r m a t i o n   y o u   p r o v i d e   a b o u t   y o u r   b u s i n e s s ,   t h e   t o o l   a u t o m a t i c a l l y   g e n e r a t e s   h u n d r e d s   o f   k e y w o r d s   a n d   b i d s   o n   e a c h   k e y w o r d ( s )   u s i n g   p r o p r i e t a r y   t e c h n o l o g y   a n d   a r t i f i c i a l   i n t e l l i g e n c e .   T h e   t o o l   m o n i t o r s   a n d   d y n a m i c a l l y   c h a n g e s   t h e   b i d s   o v e r   t i m e ,   a c r o s s   s e a r c h   e n g i n e s   t o   g i v e   y o u   t h e   b e s t   p o s s i b l e   c o s t   p e r   v i s i t o r ,   a n d   t h e r e f o r e ,   t h e   b e s t   r e t u r n   o n   y o u r   i n v e s t m e n t .   I t ' ' s   i m p o r t a n t   t o   n o t e   t h a t   y o u   a r e   n o t   c h a r g e d   f o r   y o u r   a d s   t h a t   p o t e n t i a l   c u s t o m e r s   s e e .   Y o u   a r e   o n l y   c h a r g e d   f o r   t h o s e   v i s i t o r s   t h a t   c l i c k e d   o n   y o u r   a d s   a n d   l a n d   o n   y o u r   w e b s i t e . < / p > < / l i >  
 < l i > < p > < b > W h a t   d o e s   C P C   m e a n ? < / b > < b r > C P C   i s   c o s t   p e r   c l i c k ,   w h i c h   i s   t h e   a m o u n t   o f   m o n e y   t h a t   i s   s p e n t   o n   e a c h   c l i c k   o n   y o u r   s e a r c h   e n g i n e   a d v e r t i s e m e n t . < / p > < / l i >  
 < l i > < p > < b > W h i c h   s e a r c h   e n g i n e s   w i l l   m y   a d s   a p p e a r   i n ? < / b > < b r > T h e   t o o l   p l a c e s   a d v e r t i s e m e n t s   i n   G o o g l e   a n d   B i n g / Y a h o o !   Y o u   h a v e   t h e   c h o i c e   w h i c h   s e a r c h   e n g i n e   y o u   w a n t   y o u r   a d s   t o   a p p e a r ,   a l t h o u g h   w e   r e c o m m e n d   y o u   u s e   a l l   o f   t h e m . < / p > < / l i >  
 < / o l >  
 < h 3 > C r e a t i n g   A d   C a m p a i g n s < / h 3 >  
 < o l   s t a r t = " 7 " >  
 < l i > < p > < b > H o w   m a n y   a d s   s h o u l d   I   c r e a t e ? < / b > < b r > S E M p l e s t   o n l y   r e q u i r e s   o n e   a d   c o p y ,   b u t   y o u   a r e   e n c o u r a g e d   t o   t r y   s e v e r a l   d i f f e r e n t   a d s   a n d   t h e   t o o l     w i l l   r o t a t e   a n d   m o n i t o r   t o   s e e   w h i c h   i s   p e r f o r m i n g   b e t t e r .   T h e   b e t t e r   p e r f o r m i n g   a d   w i l l   b e   u s e d   m o r e   o f t e n   t o   h e l p   m a x i m i z e   t h e   n u m b e r   o f   v i s i t o r s   t o   y o u r   s i t e . < / p > < / l i >  
 < l i > < p > < b > W h y   a m   I   b e i n g   a s k e d   t o   s e l e c t   l o c a t i o n s   t o   a d v e r t i s e   i n ? < / b > < b r > S e l e c t i n g   l o c a t i o n s   w i l l   h e l p   t a r g e t   y o u r   a d s   t o   t h e   s p e c i f i c   g e o g r a p h i c   a r e a s   i n   w h i c h   y o u   w o u l d   l i k e   t o   m a r k e t   y o u r   s e r v i c e s   a n d   p r o d u c t s . < / p > < / l i >  
 < l i > < p > < b > W h a t   i s   a   k e y w o r d ? < / b > < b r > K e y w o r d s   a r e   w o r d s   b r o w s e r s   t y p e   i n t o   s e a r c h   e n g i n e s   t o   f i n d   i n f o r m a t i o n   r e l a t i n g   t o   t h a t   s e a r c h   t e r m .   W h e n   a   k e y w o r d   i s   t y p e d   i n t o   a   s e a r c h   b o x   o n   a   s e a r c h   e n g i n e ,   t h e   e n g i n e   u s e s   t h a t   k e y w o r d   t o   s e a r c h   t h e   w e b   f o r   r e l e v a n t   w e b   s i t e s . < / p > < / l i >  
 < l i > < p > < b > W h a t   i s   a   l o n g   t a i l   k e y w o r d ? < / b > < b r > L o n g   t a i l   k e y w o r d   r e f e r s   t o   s e v e r a l   k e y w o r d s   o r   p h r a s e s   a   u s e r   t y p e s   i n t o   a   s e a r c h   e n g i n e   t o   f i n d   r e l e v a n t   i n f o r m a t i o n .   F o r   e x a m p l e ,   " f l o w e r s "   w o u l d   b e   c o n s i d e r e d   a   b r o a d   k e y w o r d ,   w h e r e a s   " f l o w e r s   f o r   a   J u n e   w e d d i n g "   w o u l d   b e   a   l o n g   t a i l   p h r a s e . < / p > < / l i >  
 < l i > < p > < b > W h a t   i s   a   n e g a t i v e   k e y w o r d ? < / b > < b r > N e g a t i v e   k e y w o r d s   a r e   k e y w o r d s   w i t h i n   a   p a i d   s e a r c h   c a m p a i g n   t h a t   p r e v e n t   y o u r   a d   f r o m   s h o w i n g   u p .   F o r   e x a m p l e ,   i f   y o u   a r e   a   f l o r i s t   w h o   o n l y   s e l l s   f r e s h   f l o w e r s ,   y o u   m a y   m a k e   " s i l k "   a   n e g a t i v e   k e y w o r d . < / p > < / l i >  
 < l i > < p > < b > H o w   d i d   y o u   c o m e   u p   w i t h   t h e   p a r t i c u l a r   k e y w o r d s   f o r   m y   a d v e r t i s e m e n t ? < / b > < b r > B a s e d   o n   t h e   i n f o r m a t i o n   y o u   e n t e r e d   t o   d e s c r i b e   y o u r   b u s i n e s s ,   a l o n g   w i t h   y o u r   s e l e c t e d   c a t e g o r y ,   a d   c o p y ,   w e b s i t e   a n d   l o c a t i o n ,   w e   g e n e r a t e d   t h e   b e s t   s e t   o f   k e y w o r d s   t o   m a t c h   w h a t   y o u r   t a r g e t   a u d i e n c e   i s   u s i n g   a s   s e a r c h   t e r m s . < / p > < / l i >  
 < l i > < p > < b > W h a t   d o   I   d o   i f   I   s e e   a   k e y w o r d   t h a t   I   d o n ' ' t   w a n t   m y   a d   t o   a p p e a r   u n d e r ? < / b > < b r > Y o u   m a y   r e m o v e   k e y w o r d s   t h a t   y o u   d o n ' ' t   w a n t   t o   s e e   y o u r   a d s   t o   a p p e a r   u n d e r   b y   c h e c k i n g   o f f   t h o s e   k e y w o r d s   f r o m   t h e   l i n k   t h a t   a p p e a r s   o n   y o u r   a d v e r t i s e m e n t   s u m m a r y   s c r e e n . < / p > < / l i >  
 < l i > < p > < b > W h a t   i f   I   d o n ' ' t   s e e   a   k e y w o r d   t h a t   I   w o u l d   l i k e   t o   b i d   o n ? < / b > < b r > W i t h   a   t y p i c a l   S E M   c a m p a i g n   y o u   b i d   o n   t h e   b i g   k e y w o r d s   t h a t   e v e r y o n e   e l s e   w a n t s .   Y o u ' ' l l   h a v e   t o   b i d   v e r y   h i g h   t o   w i n   t h o s e   w o r d s   a n d   p h r a s e s   s o   y o u r   m o n t h l y   b u d g e t   d o e s n ' ' t   g o   t o o   f a r .   W i t h   S E M p l e s t ' ' s   t o o l ,   w e   f i n d   y o u   a   l a r g e   n u m b e r   o f   k e y w o r d s   a n d   p h r a s e s   t h a t ,   i n d i v i d u a l l y ,   a r e   n o t   c l i c k e d   a s   o f t e n ,   b u t   t o g e t h e r ,   i n   t o t a l ,   c a n   g e t   y o u   m a n y   m o r e   h i g h   v a l u e   p r o s p e c t s   f o r   t h e   s a m e   i n v e s t m e n t . < / p > < / l i >  
 < l i > < p > < b > W h a t   a r e   S i t e l i n k s ? < / b > < b r > S i t e l i n k s   a r e   s u b   l a n d i n g   p a g e s   t h a t   s o m e t i m e s   a p p e a r   u n d e r   a   s e a r c h   a d v e r t i s e m e n t   a n d   a r e   m e a n t   t o   h e l p   u s e r s   n a v i g a t e   y o u r   s i t e .     C u r r e n t l y ,   s i t e   l i n k s   a r e   o n l y   a v a i l a b l e   f o r   s e a r c h   c a m p a i g n s   v i a   G o o g l e . < / p > < / l i >  
 < l i > < p > < b > C a n   I   e d i t   m y   c a m p a i g n   a f t e r   i t   i s   s t a r t e d ? < / b > < b r > Y e s ,   y o u   m a y   e d i t   y o u r   c a m p a i g n   a t   a n y   t i m e . < / p > < / l i >  
 < l i > < p > < b > C a n   I   s t o p   m y   c a m p a i g n   i f   I   d o n ' ' t   w a n t   t o   c o n t i n u e ? < / b > < b r > Y e s ,   y o u   m a y   s t o p   y o u r   c a m p a i g n   a t   a n y   t i m e . < / p > < / l i >  
 < l i > < p > < b > C a n   I   r e s t a r t   m y   c a m p a i g n   i f   i t   h a s   b e e n   s t o p p e d ? < / b > < b r > Y e s . < / p > < / l i >  
 < / o l >  
  
 < h 3 > C a m p a i g n   B i l l i n g < / h 3 >  
 < o l   s t a r t = " 1 9 " >  
 < l i > < p > < b > H o w   d o   I   a d d   o r   c h a n g e   a   c r e d i t   c a r d ? < / b > < b r > T h i s   c a n   a l l   b e   d o n e   o n l i n e   i n   y o u r   a c c o u n t   d a s h b o a r d . < / p > < / l i >  
 < l i > < p > < b > H o w   a m   I   b i l l e d ? < / b > < b r > W h e n   y o u   f i r s t   s t a r t   a   c a m p a i g n ,   w e   i m m e d i a t e l y   b i l l   y o u r   s e l e c t e d   c r e d i t   c a r d   f o r   t h e   a m o u n t   o f   t h e   m o n t h l y   b u d g e t   y o u   s e t ,   a l o n g   w i t h   a n y   S E M p l e s t   f e e s .   O n   a   r e o c c u r r i n g   m o n t h l y   b a s i s ,   w e   w i l l   b i l l   y o u r   c a r d   a p p r o x i m a t e l y   7   d a y s   b e f o r e   t h e   n e x t   m o n t h   o f   s e r v i c e s   i s   d u e   t o   b e g i n .   A n y   u n u s e d   b u d g e t   f r o m   t h e   p r e v i o u s   m o n t h   w i l l   r o l l   o v e r   i n t o   t h e   n e x t   f u l l   b i l l i n g   c y c l e   ( e . g .   i f   o n l y   h a l f   y o u r   b u d g e t   w a s   u s e d   t h i s   m o n t h ,   t h e   u n u s e d   a m o u n t   w i l l   r o l l   o v e r   a n d   y o u ' ' l l   o n l y   b e   c h a r g e d   h a l f   y o u r   b u d g e t   d u r i n g   t h e   n e x t   b i l l i n g   c y c l e ! ) .   P l e a s e   n o t e ,   s e r v i c e s   c a n n o t   b e g i n   u n t i l   y o u r   c r e d i t   c a r d   h a s   b e e n   a p p r o v e d . < / p > < / l i >  
 < l i > < p > < b > I   c h a n g e d   m y   c a m p a i g n   b u d g e t   i n   t h e   m i d d l e   o f   t h e   m o n t h ,   b u t   t h e   c h a n g e   i s   n o t   r e f l e c t e d   o n   t h e   c a m p a i g n   i n f o r m a t i o n   p a g e . < / b > < b r > A n y   c h a n g e s   t o   y o u r   c a m p a i g n   b u d g e t   w i l l   b e   r e f l e c t e d   d u r i n g   t h e   n e x t   b i l l i n g   c y c l e   ( i . e . ,   t h e   n e x t   m o n t h ) . < / p > < / l i >  
 < l i > < p > < b > W h y   d i d   I   g e t   c h a r g e d   m o r e   t h a n   m y   b u d g e t ? < / b > < b r > O c c a s i o n a l l y   t h e r e   a r e   c h a r g e s   a p p l i e d   b y   t h e   s e a r c h   e n g i n e s   a f t e r   y o u r   b u d g e t   h a s   b e e n   u s e d   u p .   T h i s   r a r e l y   o c c u r s ,   a n d   w i l l   g e n e r a l l y   b e   c o n s t r a i n e d   t o   s e v e r a l   d o l l a r s   o v e r   y o u r   b u d g e t .   A n y   o v e r a g e s   w i l l   b e   r e f l e c t e d   o n   y o u r   n e x t   m o n t h ' ' s   b i l l . < / p > < / l i >  
 < l i > < p > < b > W h a t   i f   I   a m   n o t   u s i n g   t h e   t o o l   a n y m o r e   a n d   I   w a n t   a   r e f u n d   o f   t h e   r e m a i n i n g   m o n e y   o n   m y   a c c o u n t ? < / b > < b r > F i r s t ,   s t o p   a n y   a c t i v e   c a m p a i g n s .   T h e n ,   e m a i l   h e l p @ s e m p l e s t . c o m   t o   r e q u e s t   a   r e f u n d .   N o t e   t h a t   y o u   w i l l   n o t   b e   a b l e   t o   r e c e i v e   a   r e f u n d   u n t i l   t h e   e n d   o f   t h e   c u r r e n t   b i l l i n g   c y c l e . < / p > < / l i >  
 < / o l >  
  
 < h 3 > C a m p a i g n   R e p o r t i n g   a n d   C o m m u n i c a t i o n s < / h 3 >  
 < o l   s t a r t = " 2 4 " >  
 < l i > < p > < b > I   r e c e i v e d   a n   e m a i l   t e l l i n g   m e   t h a t   m y   a c c o u n t   h a s   b e e n   s u s p e n d e d .   W h y ? < / b > < b r > A c c o u n t s   c a n   b e   s u s p e n d e d   f o r   a   n u m b e r   o f   r e a s o n s ,   m o s t   o f t e n   b e c a u s e   o f   b i l l i n g   i s s u e s .   P l e a s e   m a k e   s u r e   y o u   h a v e   a n   u p d a t e d   c r e d i t   c a r d   o n   f i l e   o r   e m a i l   h e l p @ s e m p l e s t . c o m   t o   w o r k   w i t h   a   r e p r e s e n t a t i v e   t o   c o r r e c t   a n y   a c c o u n t   i s s u e s .   O n c e   t h e   i s s u e ( s )   h a s   b e e n   c o r r e c t e d ,   t h e   r e p r e s e n t a t i v e   c a n   u n - s u s p e n d   y o u r   a c c o u n t . < / p > < / l i >  
 < l i > < p > < b > W h y   d i d   I   s t o p   r e c e i v i n g   c l i c k s   o n   m y   c a m p a i g n   p a r t   w a y   t h r o u g h   t h e   m o n t h ?   I   w a s   g e t t i n g   a   l o t   o f   t r a f f i c ! < / b > < b r > O n c e   y o u r   c a m p a i g n ' ' s   b u d g e t   h a s   b e e n   e x h a u s t e d   f o r   a   p a r t i c u l a r   m o n t h ,   t h e   c a m p a i g n   w i l l   b e   p a u s e d   u n t i l   t h e   n e x t   m o n t h .   I f   t h i s   o c c u r s   c o n s i s t e n t l y ,   y o u   s h o u l d   c o n s i d e r   i n c r e a s i n g   y o u r   c a m p a i g n   b u d g e t . < / p > < / l i >  
 < l i > < p > < b > H o w   c a n   I   t r a c k   m y   r e s u l t s ? < / b > < b r > Y o u   c a n   t r a c k   y o u r   r e s u l t s   b y   l o g g i n g   i n t o   t h e   t o o l   a n d   v i s i t   t h e   " R e p o r t i n g "   s e c t i o n . < / p > < / l i >  
 < l i > < p > < b > W h y   d i d   I   r e c e i v e   a n   e m a i l   s a y i n g   m y   c a m p a i g n   h a d   b e e n   r e j e c t e d ? < / b > < b r > I f   t h e   a d   y o u   e n t e r e d   c o n t a i n e d   c o n t e n t   o b j e c t i o n a b l e   t o   a   s e a r c h   e n g i n e   ( l a n g u a g e   t h a t   i s   o b s c e n e ,   p r o p r i e t a r y / t r a d e m a r k e d ,   s p a m ,   e t c . ) ,   i t ' ' s   p o s s i b l e   t h a t   t h e   s e a r c h   e n g i n e   w i l l   l a t e r   r e v i e w   y o u r   a d   a n d   r e j e c t   i t .   I f   t h i s   o c c u r s ,   w e ' ' l l   s e n d   y o u   a n   e m a i l   a n d   a s k   y o u   t o   r e w r i t e   a n d   r e s u b m i t   y o u r   a d s . < / p > < / l i >  
 < / o l >  
 F o r   a d d i t i o n a l   q u e s t i o n s   o r   c o n c e r n s ,   p l e a s e   r e a c h   o u t   t o   S E M p l e s t   a t   [ h e l p @ s e m p l e s t . c o m ] '  
 ,  
 ' < p > S E M p l e s t   i s   t h e   o n l y   S E M   p r o v i d e r   t o   o f f e r   e v e n   n o v i c e   u s e r s   a   s i m p l e ,   " d o - i t - y o u r s e l f "   o p t i o n   t o   c r e a t e   s e a r c h   m a r k e t i n g   c a m p a i g n s   t h a t   d e l i v e r s   e f f e c t i v e   r e s u l t s . < / p >  
 < p > I n   j u s t   t h r e e   s i m p l e   s t e p s ,   b u s i n e s s e s   c a n   s i m u l t a n e o u s l y   p u r c h a s e   k e y w o r d s   a n d   c r e a t e   a d s   o n   m u l t i p l e   s e a r c h   e n g i n e s   u s i n g   n e w   t e c h n o l o g i e s   t h a t   a u t o m a t e   k e y w o r d   s e l e c t i o n ,   b i d d i n g   a n d   c a m p a i g n   c r e a t i o n .   T h e n ,   l e t   u s   d o   a l l   t h e   h e a v y   l i f t i n g   t o   m a n a g e   y o u r   c a m p a i g n   o n   a n   o n g o i n g   b a s i s   w i t h   o u r   p r o p r i e t a r y   b i d d i n g   a l g o r i t h m   t h a t   c o n s t a n t l y   m a k e s   s u r e   y o u   a r e   g e t t i n g   t h e   b e s t   b a n g   f o r   y o u r   b u c k   a c r o s s   G o o g l e ,   B i n g   a n d   Y a h o o ! < / p >  
 < p > W e   a r e   t h e   o n l y   S E M   p r o v i d e r   t o   o f f e r < / p >  
 < u l >  
 < l i > A u t o m a t e d   o p t i m i z a t i o n :   d y n a m i c a l l y   o p t i m i z i n g   k e y w o r d   p u r c h a s e s   a n d   o n g o i n g   c a m p a i g n   m a n a g e m e n t < / l i >  
 < l i > P e r s o n a l i z a t i o n :   h u n d r e d s   o f   u n i q u e   k e y w o r d s   p u r c h a s e d   f o r   e a c h   a d v e r t i s e r < / l i >  
 < l i > I n t e l l i g e n t   s p e n d   o f   m o n e y :     a u t o m a t i c a l l y   g e n e r a t i n g   a n d   o p t i m i z i n g   h u n d r e d s   o f   l o n g   t a i l   k e y w o r d s   w h i c h   d r i v e s   d o w n   a d v e r t i s e r   e x p e n s e s   ( l o w e r s   c o s t   p e r   c l i c k ) < / l i >  
 < l i > T r a n s p a r e n t   p r i c i n g :   n o   h i d d e n   c h a r g e s   o r   m a r k - u p s < / l i >  
 < l i > C o s t   e f f i c i e n c i e s :   S E M p l e s t ' ' s   a u t o m a t e d   t e c h n o l o g y   c r e a t e s   l o w e r   o v e r h e a d   e x p e n s e s < / l i >  
 < / u l >  
 < p > I t ' ' s   r e a l l y   a s   s i m p l e   a s   o n e ,   t w o ,   t h r e e : < / p >  
 < p > 1 . B r i e f l y   D e s c r i b e   Y o u r   B u s i n e s s < b r > [ I M A G E ] < b r > 2 .   C r e a t e   Y o u r   A d s < b r > [ I M A G E ] < b r > 3 .   L a u n c h   Y o u r   C a m p a i g n < b r > [ I M A G E ] < b r > < / p >  
 < p > C l i c k   h e r e   t o   s c h e d u l e   a   d e m o   o r   e m a i l   i n f o @ s e m p l e s t . c o m < / p >  
 < p > < b > S E M P L E S T   M A N A G E M E N T   T E A M < / b > < / p >  
 < p > P a u l   B e n j o u      C h i e f   E x e c u t i v e   O f f i c e r < b r > M r .   B e n j o u   b r i n g s   o v e r   3 5   y e a r s   o f   e x e c u t i v e   l e v e l   m a n a g e m e n t   t o   S E M p l e s t .   M r .   B e n j o u   h a s   b e e n   t h e   F o u n d e r   a n d   P r i n c i p a l   a t   T h e   C e n t e r   f o r   M e d i a   M a n a g e m e n t   S t r a t e g i e s ,   a   c o n s u l t a n c y   s e r v i n g   d i g i t a l   m e d i a   c o m p a n i e s   a n d   p r i o r   c o m p a n i e s   i n c l u d e   U n i v e r s a l   M c C a n n ,   D r a f t W o r l d w i d e ,   V a l u e C l i c k   a n d   D a t r a n   M e d i a .     H e   s e r v e s   a s   a   S e n i o r   F e l l o w   a n d   A d v i s o r y   B o a r d   m e m b e r   w i t h   t h e   S o c i e t y   f o r   N e w   C o m m u n i c a t i o n s   R e s e a r c h   a n d   i s   a   s u s t a i n i n g   m e m b e r   o f   t h e   A m e r i c a n   I n s t i t u t e   f o r   E c o n o m i c   R e s e a r c h .   H e   s e r v e d   o n   t h e   B o a r d   o f   G l o b a l   N e t w o r k s ,   I n c .   a n d   r e m a i n s   a s   a n   a d v i s o r . < / p >  
 < p > M i t c h e l l   B e r g ,   P h . D .      C h i e f   T e c h n o l o g y   O f f i c e r < b r > M r .   B e r g   h a s   o v e r   2 5   y e a r s   o f   t e c h n o l o g y   a n d   s o f t w a r e   a r c h i t e c t u r e   a n d   d e v e l o p m e n t   e x p e r i e n c e   w i t h   a   f o c u s   o n   d e v e l o p i n g   a n d   c o m m e r c i a l i z i n g   R & D .   P r e v i o u s   r o l e s   i n c l u d e d   C h i e f   I n f o r m a t i o n   O f f i c e r   o f   B e n e f i t P l a n   M a n a g e r   C o r p .   a n d   A d v a n c e d   I n f o r m a t i o n   T e c h n o l o g i s t   a t   T h e   B o e i n g   C o m p a n y . < / p >  
 < p > C h a d   M i l l e r      C h i e f   R e v e n u e   O f f i c e r < b r > M r .   M i l l e r   h a s   b e e n   i n   t h e   d i g i t a l   a n d   t e c h n o l o g y   i n d u s t r y   f o r   1 5   y e a r s .   D u r i n g   m o s t   o f   t h i s   p e r i o d   h e   h a s   b e e n   f o c u s e d   o n   m a r k e t i n g   a n d   s e l l i n g   t e c h n o l o g y   a n d   m e d i a   s e r v i c e s   i n v o l v i n g   e m a i l ,   d i s p l a y   a n d   a n a l y t i c s   w i t h   c o m p a n i e s   l i k e   N i e l s e n ,   A c c e n t u r e   a n d   V a l u e c l i c k . < / p >  
 < p > N i c o l e   R a g a i n s      E x e c u t i v e   V i c e   P r e s i d e n t ,   O p e r a t i o n s < b r > M s .   R a g a i n s   h a s   b e e n   i n   t h e   f i n a n c i a l   a n d   d i g i t a l   i n d u s t r i e s   f o r   o v e r   1 1   y e a r s .   P r i o r   r o l e s   i n c l u d e d   r u n n i n g   C o r p o r a t e   D e v e l o p m e n t   f o r   X O   G r o u p   a n d   f i n a n c i a l   c o n s u l t i n g   f o r   H u r o n   C o n s u l t i n g   G r o u p   a n d   A r t h u r   A n d e r s e n . < / p > ' ) 