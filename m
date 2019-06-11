Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D03D6D5
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7546B3EB0E9
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A86473EA384
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DD198600926
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE062AF7B;
 Tue, 11 Jun 2019 19:30:43 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Jun 2019 21:30:20 +0200
Message-Id: <20190611193021.17651-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611193021.17651-1-pvorel@suse.cz>
References: <20190611193021.17651-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Ignaz Forster <iforster@suse.de>
Subject: [LTP] [PATCH v3 3/4] ima/ima_measurements.sh: Require builtin IMA
	tcb policy
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

QWx0aG91Z2ggY3VzdG9tIHBvbGljeSB3aGljaCBjb250YWlucyB0Y2IgY2FuIGJlIGxvYWRlZCB2
aWEgZHJhY3V0LApzeXN0ZW1kIG9yIGxhdGVyIG1hbnVhbGx5IGZyb20gdXNlciBzcGFjZSwgZGV0
ZWN0aW5nIGl0IHdvdWxkIHJlcXVpcmUKSU1BX1JFQURfUE9MSUNZPXkuIEluIG9yZGVyIHRvIHNp
bXBsaWZ5IHRoZSBjaGVjayBhbmQgYXZvaWQgZmFsc2UKcG9zaXRpdmVzIGxldHMgaWdub3JlIHRo
aXMgb3B0aW9uIGFuZCByZXF1aXJlIGJ1aWx0aW4gSU1BIHRjYiBwb2xpY3kuCgpTaWduZWQtb2Zm
LWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KLS0tCiAuLi4va2VybmVsL3NlY3VyaXR5
L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX21lYXN1cmVtZW50cy5zaCAgICB8IDMgKystCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9tZWFzdXJl
bWVudHMuc2ggYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMv
aW1hX21lYXN1cmVtZW50cy5zaAppbmRleCAzMjhhZmZjNDMuLmEzYWEyNGQ4YSAxMDA3NTUKLS0t
IGEvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9tZWFz
dXJlbWVudHMuc2gKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1h
L3Rlc3RzL2ltYV9tZWFzdXJlbWVudHMuc2gKQEAgLTU3LDcgKzU3LDggQEAgc2V0dXAoKQogCVsg
LXogIiRESUdFU1RfSU5ERVgiIF0gJiYgdHN0X2JyayBUQ09ORiBcCiAJCSJDYW5ub3QgZmluZCBk
aWdlc3QgaW5kZXggKHRlbXBsYXRlOiAnJHRlbXBsYXRlJykiCiAKLQl0c3RfcmVzIFRJTkZPICJJ
TUEgbWVhc3VyZW1lbnQgdGVzdHMgYXNzdW1lIHRjYiBwb2xpY3kgdG8gYmUgbG9hZGVkIChpbWFf
cG9saWN5PXRjYikiCisJZ3JlcCAtcSAtZSBpbWFfcG9saWN5PVthLXpfXSp0Y2IgLWUgaW1hX3Rj
YiAtZSBpbWFfYXBwcmFpc2VfdGNiIC9wcm9jL2NtZGxpbmUgfHwgXAorCQl0c3RfYnJrIFRDT05G
ICJJTUEgbWVhc3VyZW1lbnQgdGVzdHMgcmVxdWlyZSBidWlsdGluIElNQSB0Y2IgcG9saWN5IChp
bWFfcG9saWN5PXRjYiBvciBpbWFfcG9saWN5PWFwcHJhaXNlX3RjYiBrZXJuZWwgcGFyYW1ldGVy
KSIKIH0KIAogIyBUT0RPOiBmaW5kIHN1cHBvcnQgZm9yIHJtZDEyOCBybWQyNTYgcm1kMzIwIHdw
MjU2IHdwMzg0IHRncjEyOCB0Z3IxNjAKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
