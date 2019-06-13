Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B544173
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:14:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39129294AFF
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:14:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 81FA0294AA9
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:14:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F1691200CE7
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:14:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D87AAC94;
 Thu, 13 Jun 2019 16:14:46 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 13 Jun 2019 18:14:10 +0200
Message-Id: <20190613161414.29161-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Ignaz Forster <iforster@suse.de>
Subject: [LTP] [PATCH v4 0/4] LTP reproducer on broken IMA on overlayfs
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

SGkgTWltaSwgSWduYXosCgpjaGFuZ2VzIHYzLT52NDoKKiBBZGQgaGVscGVyIGNoZWNrX2ltYV9w
b2xpY3koKSBhbmQgdXNlIGl0IGluIGltYV9tZWFzdXJlbWVudHMuc2ggYW5kCiAgZXZtX292ZXJs
YXkuc2gKKiBSZXBocmFzZSBjb21taXQgbWVzc2FnZSBmb3IgaW1hX21lYXN1cmVtZW50cy5zaCBj
aGFuZ2VzIGFuZCBkb2NzCiogVXNlIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9y
LWxhdGVyCgpBbnl0aGluZyB3cm9uZyBpbiBkb2NzIC8gY29tbWl0IG1lc3NhZ2U/CgpLaW5kIHJl
Z2FyZHMsClBldHIKClBldHIgVm9yZWwgKDQpOgogIGltYTogQ2FsbCB0ZXN0J3MgY2xlYW51cCBp
bnNpZGUgaW1hX3NldHVwLnNoIGNsZWFudXAKICBzaGVsbDogQWRkICRUU1RfREVWSUNFIGFzIGRl
ZmF1bHQgcGFyYW1ldGVyIHRvIHRzdF91bW91bnQKICBpbWEvaW1hX21lYXN1cmVtZW50cy5zaDog
UmVxdWlyZSBidWlsdGluIElNQSB0Y2IgcG9saWN5CiAgaW1hOiBBZGQgb3ZlcmxheSB0ZXN0ICsg
ZG9jCgogZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dCAgICAgICAgICAgICAgIHwgIDQg
Ky0KIHJ1bnRlc3QvaW1hICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsK
IHRlc3RjYXNlcy9jb21tYW5kcy9kZi9kZjAxLnNoICAgICAgICAgICAgICAgICB8ICA3ICstCiB0
ZXN0Y2FzZXMvY29tbWFuZHMvbWtmcy9ta2ZzMDEuc2ggICAgICAgICAgICAgfCAgMiArLQogLi4u
L3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvUkVBRE1FLm1kICAgIHwgODMgKysrKysrKysr
KysrKysrKysKIC4uLi9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2V2bV9vdmVybGF5LnNoICAgICAgICB8
IDkzICsrKysrKysrKysrKysrKysrKysKIC4uLi9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9tZWFz
dXJlbWVudHMuc2ggICB8IDIzICstLS0tCiAuLi4vc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0
cy9pbWFfc2V0dXAuc2ggfCA0MiArKysrKy0tLS0KIC4uLi9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2lt
YV92aW9sYXRpb25zLnNoICAgICB8ICAyIC0KIHRlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2ggICAg
ICAgICAgICAgICAgICAgICB8ICAyICstCiAxMCBmaWxlcyBjaGFuZ2VkLCAyMTEgaW5zZXJ0aW9u
cygrKSwgNDggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5l
bC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL1JFQURNRS5tZAogY3JlYXRlIG1vZGUgMTAw
NzU1IHRlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9ldm1fb3Zl
cmxheS5zaAoKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
