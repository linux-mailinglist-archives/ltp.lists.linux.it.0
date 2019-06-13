Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784B43347
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 09:24:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 526C7294AB9
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 09:24:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 71DB83EA787
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 09:24:12 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7B9BC1A016C7
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 09:24:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 10D3A309175F
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 07:24:09 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D5717981C
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 07:24:08 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 13 Jun 2019 09:23:59 +0200
Message-Id: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 13 Jun 2019 07:24:09 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] lib: add ltp_alloc_stack()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

TWVhbnQgdG8gYWxsb2NhdGUgc3RhY2sgd2l0aCBzdWZmaWNpZW50IGFsaWdubWVudCBmb3IgYWxs
IGFyY2hlcy4KVXNlIGl0IGluIGxpYi9jbG9uZXIuYyBpbnN0ZWFkIG9mIG1hbGxvYygpLgoKU2ln
bmVkLW9mZi1ieTogSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVk
ZS90c3RfY2xvbmUuaCB8ICAxICsKIGxpYi9jbG9uZXIuYyAgICAgICAgfCAyMyArKysrKysrKysr
KysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X2Nsb25lLmggYi9pbmNsdWRlL3RzdF9j
bG9uZS5oCmluZGV4IDcyMTQ1ZmFiZTdjZC4uNzg2Y2VlNWQxMjA5IDEwMDY0NAotLS0gYS9pbmNs
dWRlL3RzdF9jbG9uZS5oCisrKyBiL2luY2x1ZGUvdHN0X2Nsb25lLmgKQEAgLTMzLDYgKzMzLDcg
QEAgaW50IGx0cF9jbG9uZV9tYWxsb2ModW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgaW50ICgq
Zm4pKHZvaWQgKmFyZyksCiAJCXZvaWQgKmFyZywgc2l6ZV90IHN0YWNrc2l6ZSk7CiBpbnQgbHRw
X2Nsb25lX3F1aWNrKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxhZ3MsIGludCAoKmZuKSh2b2lkICph
cmcpLAogCQl2b2lkICphcmcpOwordm9pZCAqbHRwX2FsbG9jX3N0YWNrKHNpemVfdCBzaXplKTsK
IAogI2RlZmluZSBjbG9uZSguLi4pICh1c2VfdGhlX2x0cF9jbG9uZV9mdW5jdGlvbnNfX2RvX25v
dF91c2VfY2xvbmUpCiAKZGlmZiAtLWdpdCBhL2xpYi9jbG9uZXIuYyBiL2xpYi9jbG9uZXIuYwpp
bmRleCA2M2YyMjNkMmExNTAuLmNmMzcxODRhYTIyYSAxMDA2NDQKLS0tIGEvbGliL2Nsb25lci5j
CisrKyBiL2xpYi9jbG9uZXIuYwpAQCAtMjgsOCArMjgsNyBAQAogI2luY2x1ZGUgPHN0ZGxpYi5o
PgogI2luY2x1ZGUgPHNjaGVkLmg+CiAjaW5jbHVkZSA8c3RkYXJnLmg+Ci0jaW5jbHVkZSAidGVz
dC5oIgotI2luY2x1ZGUgImNvbmZpZy5oIgorI2luY2x1ZGUgInRzdF9jbG9uZS5oIgogCiAjdW5k
ZWYgY2xvbmUJCQkvKiB3ZSB3YW50IHRvIHVzZSBjbG9uZSgpICovCiAKQEAgLTExOCw2ICsxMTcs
MjQgQEAgaW50IGx0cF9jbG9uZTcodW5zaWduZWQgbG9uZyBmbGFncywgaW50ICgqZm4pKHZvaWQg
KmFyZyksIHZvaWQgKmFyZywKIH0KIAogLyoKKyAqIGx0cF9hbGxvY19zdGFjazogYWxsb2NhdGUg
c3RhY2sgb2Ygc2l6ZSAnc2l6ZScsIHRoYXQgaXMgc3VmZmljaWVudGx5CisgKiBhbGlnbmVkIGZv
ciBhbGwgYXJjaGVzLiBVc2VyIGlzIHJlc3BvbnNpYmxlIGZvciBmcmVlaW5nIGFsbG9jYXRlZAor
ICogbWVtb3J5LgorICogUmV0dXJucyBwb2ludGVyIHRvIG5ldyBzdGFjay4gT24gZXJyb3IsIHJl
dHVybnMgTlVMTCB3aXRoIGVycm5vIHNldC4KKyAqLwordm9pZCAqbHRwX2FsbG9jX3N0YWNrKHNp
emVfdCBzaXplKQoreworCXZvaWQgKnJldCA9IE5VTEw7CisJaW50IGVycjsKKworCWVyciA9IHBv
c2l4X21lbWFsaWduKCZyZXQsIDY0LCBzaXplKTsKKwlpZiAoZXJyKQorCQllcnJubyA9IGVycjsK
KworCXJldHVybiByZXQ7Cit9CisKKy8qCiAgKiBsdHBfY2xvbmVfbWFsbG9jOiBhbHNvIGRvZXMg
dGhlIG1lbW9yeSBhbGxvY2F0aW9uIGZvciBjbG9uZSB3aXRoIGEKICAqIGNhbGxlci1zcGVjaWZp
ZWQgc2l6ZS4KICAqLwpAQCAtMTI5LDcgKzE0Niw3IEBAIGx0cF9jbG9uZV9tYWxsb2ModW5zaWdu
ZWQgbG9uZyBjbG9uZV9mbGFncywgaW50ICgqZm4pICh2b2lkICphcmcpLCB2b2lkICphcmcsCiAJ
aW50IHJldDsKIAlpbnQgc2F2ZWRfZXJybm87CiAKLQlzdGFjayA9IG1hbGxvYyhzdGFja19zaXpl
KTsKKwlzdGFjayA9IGx0cF9hbGxvY19zdGFjayhzdGFja19zaXplKTsKIAlpZiAoc3RhY2sgPT0g
TlVMTCkKIAkJcmV0dXJuIC0xOwogCi0tIAoxLjguMy4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
