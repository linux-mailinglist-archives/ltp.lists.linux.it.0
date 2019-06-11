Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B03D6CF
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1E4A3EAC0E
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0EC043EA384
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 096E71A00ED7
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3613FAE1D;
 Tue, 11 Jun 2019 19:30:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Jun 2019 21:30:17 +0200
Message-Id: <20190611193021.17651-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Ignaz Forster <iforster@suse.de>
Subject: [LTP] [PATCH v3 0/4] LTP reproducer on broken IMA on overlayfs
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

SGkgTWltaSwgSWduYXosCgpzb3JyeSBmb3IgYm90aGVyaW5nIHlvdSB3aXRoIG9uZSBtb3JlIHZl
cnNpb24gb2YgdGhpcyBwYXRjaHNldC4KCkNoYW5nZXMgdjItPnYzOgoqIGFkZGVkIG9uZSBjb21t
aXQgImltYS9pbWFfbWVhc3VyZW1lbnRzLnNoOiBSZXF1aXJlIGJ1aWx0aW4gSU1BIHRjYiBwb2xp
Y3kiCnRvIGF2b2lkIGZhbHNlIHBvc2l0aXZlcyAKKiBhZGRlZCBSRUFETUUubWQgaW4gbGFzdCBj
b21taXQgKG1pZ2h0IGJlIGluIHNlcGFyYXRlIGNvbW1pdCkKClBldHIgVm9yZWwgKDQpOgogIGlt
YTogQ2FsbCB0ZXN0J3MgY2xlYW51cCBpbnNpZGUgaW1hX3NldHVwLnNoIGNsZWFudXAKICBzaGVs
bDogQWRkICRUU1RfREVWSUNFIGFzIGRlZmF1bHQgcGFyYW1ldGVyIHRvIHRzdF91bW91bnQKICBp
bWEvaW1hX21lYXN1cmVtZW50cy5zaDogUmVxdWlyZSBidWlsdGluIElNQSB0Y2IgcG9saWN5CiAg
aW1hOiBBZGQgb3ZlcmxheSB0ZXN0ICsgZG9jCgogZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVz
LnR4dCAgICAgICAgICAgICAgIHwgIDQgKy0KIHJ1bnRlc3QvaW1hICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIHRlc3RjYXNlcy9jb21tYW5kcy9kZi9kZjAxLnNoICAg
ICAgICAgICAgICAgICB8ICA3ICstCiB0ZXN0Y2FzZXMvY29tbWFuZHMvbWtmcy9ta2ZzMDEuc2gg
ICAgICAgICAgICAgfCAgMiArLQogLi4uL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvUkVB
RE1FLm1kICAgIHwgODIgKysrKysrKysrKysrKysrKwogLi4uL2ludGVncml0eS9pbWEvdGVzdHMv
ZXZtX292ZXJsYXkuc2ggICAgICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKwogLi4uL2ludGVn
cml0eS9pbWEvdGVzdHMvaW1hX21lYXN1cmVtZW50cy5zaCAgIHwgIDMgKy0KIC4uLi9zZWN1cml0
eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9zZXR1cC5zaCB8IDEyICsrLQogLi4uL2ludGVncml0
eS9pbWEvdGVzdHMvaW1hX3Zpb2xhdGlvbnMuc2ggICAgIHwgIDIgLQogdGVzdGNhc2VzL2xpYi90
c3RfdGVzdC5zaCAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQs
IDE5MiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvUkVBRE1FLm1kCiBj
cmVhdGUgbW9kZSAxMDA3NTUgdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1h
L3Rlc3RzL2V2bV9vdmVybGF5LnNoCgotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
