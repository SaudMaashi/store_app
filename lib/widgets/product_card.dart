import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        width: 250,
        child: Card(
          elevation: 0,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          widget.product.image,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        if (widget.product.hasDiscount)
                          Text(
                            "\$${widget.product.newPrice}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        else
                          Text(
                            "\$${widget.product.price}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (widget.product.hasDiscount)
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                "\$${widget.product.price}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8E8E8E),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  color: widget.product.isFavorite ? Colors.red : Colors.black,
                  onPressed: () {
                    setState(() {
                      widget.product.isFavorite = !widget.product.isFavorite;
                    });
                  },
                  icon: Icon(widget.product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
