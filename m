Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BFD38BD1
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 15:39:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04AB63EA6F6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 15:39:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0627B3EA5DC
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 15:39:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AF0D3600D74
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 15:39:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EEAE5AF25
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 13:39:51 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Jun 2019 15:39:44 +0200
Message-Id: <20190607133944.17045-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] ver_linux: Fix util-linux version for
	some distros
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

U29tZSBTTEVTIHZlcnNpb25zIG9uIHMzOTB4IGRvZXMgbm90IGNvbnRhaW4gZmRmb3JtYXQgaW4g
dXRpbC1saW51eApwYWNrYWdlLCB3aGljaCBicmVha3MgdXRpbC1saW51eCBkZXRlY3Rpb246Cgp1
dGlsLWxpbnV4ICAgICAgICAgICAgIC9vcHQvbHRwL3Zlcl9saW51eDogbGluZSA3MzogZmRmb3Jt
YXQ6IGNvbW1hbmQgbm90IGZvdW5kCgpUaHVzIHVzZSBta3N3YXAgd2hpY2ggaXMgaW4gdXRpbC1s
aW51eCBzaW5jZSB2Mi4yICh0aGUgc2FtZSBhcyBmZGZvcm1hdCkKaXQncyBjb21tb24gZW5vdWdo
ICh0aGVyZSBpcyBubyAtLWRpc2FibGUtbWtzd2FwIGJ1aWxkIGZsYWcgaW4KdXRpbC1saW51eCku
CgpXaGlsZSBvbiBpdCwgcmVtb3ZlIGFsc28gZXh0cmEgImxpbnV4ICIgb3V0cHV0IGJlZm9yZSB2
ZXJzaW9uIGNhdXNlZCBieQotRlwtIGF3ayBwYXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBQZXRy
IFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KLS0tCiB2ZXJfbGludXggfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS92ZXJfbGlu
dXggYi92ZXJfbGludXgKaW5kZXggNmMyNzA2YmFlLi44YjhiYTc5YTggMTAwNzU1Ci0tLSBhL3Zl
cl9saW51eAorKysgYi92ZXJfbGludXgKQEAgLTcwLDcgKzcwLDcgQEAgbWFrZSAtLXZlcnNpb24g
Mj4mMSB8IGF3ayAtRiwgJ3twcmludCAkMX0nIHwgYXdrIFwKIGxkIC12IDI+JjEgfCBhd2sgLUZc
KSAne3ByaW50ICQxfScgfCBhd2sgXAogICAgICAgJy9CRkQve3ByaW50ICJiaW51dGlscyAgICAg
ICAgICAgICAgIiwkTkZ9JwogCi1mZGZvcm1hdCAtLXZlcnNpb24gMj4mMSB8IGF3ayAtRlwtICd7
cHJpbnQgInV0aWwtbGludXggICAgICAgICAgICAiLCAkTkZ9JworbWtzd2FwIC1WIDI+JjEgfCBh
d2sgJ3twcmludCAidXRpbC1saW51eCAgICAgICAgICAgICIsICRORn0nCiAKIG1vdW50IC0tdmVy
c2lvbiAyPiYxIHwgYXdrIC1GXC0gJ3twcmludCAibW91bnQgICAgICAgICAgICAgICAgICIsICRO
Rn0nCiAKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
