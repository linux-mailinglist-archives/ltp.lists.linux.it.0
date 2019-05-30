Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE62F903
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:10:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B4533EA75A
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:10:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 854603EA1DA
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:10:17 +0200 (CEST)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 84430600B80
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:10:17 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=caspar@linux.alibaba.com; NM=1;
 PH=DS; RN=3; SR=0; TI=SMTPD_---0TT.sgg1_1559207410; 
Received: from linux.alibaba.com(mailfrom:caspar@linux.alibaba.com
 fp:SMTPD_---0TT.sgg1_1559207410) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 30 May 2019 17:10:12 +0800
From: Caspar Zhang <caspar@linux.alibaba.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Thu, 30 May 2019 17:09:57 +0800
Message-Id: <5e8374fa7f4ea9d64cdfc39a2ca449761327c257.1559207183.git.caspar@casparzhang.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=7.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: [LTP] [PATCH 2/3] lib/test.sh: TCONF needs to be counted
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

VENPTkYgc2hvdWxkIGFsc28gYmUgb25lIG9mIGV4aXQgc3RhdHVzZXMgaW4gYSBzaW5nbGUgdGVz
dCwgZWxzZSB0aGUKb3V0cHV0IG9mIFRTVF9DT1VOVCBpbiBzaGVsbCB0ZXN0cyBjb3VsZCBiZSB3
cm9uZy4KCldyb25nOgo8PDx0ZXN0X291dHB1dD4+PgptZW1jZ191c2VfaGllcmFyY2h5X3Rlc3Qg
MSBUSU5GTzogU3RhcnRpbmcgdGVzdCAxCm1lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdCAxIFRJTkZP
OiBzZXQgL2Rldi9tZW1jZy9tZW1vcnkudXNlX2hpZXJhcmNoeSB0byAwIGZhaWxlZAptZW1jZ191
c2VfaGllcmFyY2h5X3Rlc3QgMSBUUEFTUzogcHJvY2VzcyAyODY1OCBpcyBraWxsZWQKbWVtY2df
dXNlX2hpZXJhcmNoeV90ZXN0IDIgVElORk86IFN0YXJ0aW5nIHRlc3QgMgptZW1jZ191c2VfaGll
cmFyY2h5X3Rlc3QgMiBUSU5GTzogc2V0IC9kZXYvbWVtY2cvbWVtb3J5LnVzZV9oaWVyYXJjaHkg
dG8gMCBmYWlsZWQKbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDIgVENPTkY6IG1lbW9yeS51c2Vf
aGllcmFyY2h5IGFscmVhZHkgYmVlbiAxLCBibGFtZSBzeXN0ZW1kLCBza2lwCm1lbWNnX3VzZV9o
aWVyYXJjaHlfdGVzdCAyIFRJTkZPOiBTdGFydGluZyB0ZXN0IDMKbWVtY2dfdXNlX2hpZXJhcmNo
eV90ZXN0IDIgVElORk86IHNldCAvZGV2L21lbWNnL21lbW9yeS51c2VfaGllcmFyY2h5IHRvIDAg
ZmFpbGVkCm1lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdCAyIFRQQVNTOiBlY2hvIDAgPiBzdWJncm91
cC9tZW1vcnkudXNlX2hpZXJhcmNoeSBmYWlsZWQgYXMgZXhwZWN0ZWQKPDw8ZXhlY3V0aW9uX3N0
YXR1cz4+PgoKUmlnaHQ6Cjw8PHRlc3Rfb3V0cHV0Pj4+Cm1lbWNnX3VzZV9oaWVyYXJjaHlfdGVz
dCAxIFRJTkZPOiBTdGFydGluZyB0ZXN0IDEKbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDEgVElO
Rk86IHNldCAvZGV2L21lbWNnL21lbW9yeS51c2VfaGllcmFyY2h5IHRvIDAgZmFpbGVkCm1lbWNn
X3VzZV9oaWVyYXJjaHlfdGVzdCAxIFRQQVNTOiBwcm9jZXNzIDI2ODI1IGlzIGtpbGxlZAptZW1j
Z191c2VfaGllcmFyY2h5X3Rlc3QgMiBUSU5GTzogU3RhcnRpbmcgdGVzdCAyCm1lbWNnX3VzZV9o
aWVyYXJjaHlfdGVzdCAyIFRJTkZPOiBzZXQgL2Rldi9tZW1jZy9tZW1vcnkudXNlX2hpZXJhcmNo
eSB0byAwIGZhaWxlZAptZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMiBUQ09ORjogbWVtb3J5LnVz
ZV9oaWVyYXJjaHkgYWxyZWFkeSBiZWVuIDEsIGJsYW1lIHN5c3RlbWQsIHNraXAKbWVtY2dfdXNl
X2hpZXJhcmNoeV90ZXN0IDMgVElORk86IFN0YXJ0aW5nIHRlc3QgMwptZW1jZ191c2VfaGllcmFy
Y2h5X3Rlc3QgMyBUSU5GTzogc2V0IC9kZXYvbWVtY2cvbWVtb3J5LnVzZV9oaWVyYXJjaHkgdG8g
MCBmYWlsZWQKbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDMgVFBBU1M6IGVjaG8gMCA+IHN1Ymdy
b3VwL21lbW9yeS51c2VfaGllcmFyY2h5IGZhaWxlZCBhcyBleHBlY3RlZAo8PDxleGVjdXRpb25f
c3RhdHVzPj4+CgpTaWduZWQtb2ZmLWJ5OiBDYXNwYXIgWmhhbmcgPGNhc3BhckBsaW51eC5hbGli
YWJhLmNvbT4KLS0tCiB0ZXN0Y2FzZXMvbGliL3Rlc3Quc2ggfCAzICstLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9saWIvdGVzdC5zaCBiL3Rlc3RjYXNlcy9saWIvdGVzdC5zaAppbmRleCA2NzAyNDhlZTUuLmFk
ZThmY2RmZiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2xpYi90ZXN0LnNoCisrKyBiL3Rlc3RjYXNl
cy9saWIvdGVzdC5zaApAQCAtNTgsOCArNTgsNyBAQCB0c3RfcmVzbSgpCiAJZWNobyAiICRAIgog
CiAJY2FzZSAiJHJldCIgaW4KLQlUUEFTU3xURkFJTCkKLQlUU1RfQ09VTlQ9JCgoVFNUX0NPVU5U
KzEpKTs7CisJVFBBU1N8VEZBSUx8VENPTkYpIFRTVF9DT1VOVD0kKChUU1RfQ09VTlQrMSkpOzsK
IAllc2FjCiB9CiAKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
