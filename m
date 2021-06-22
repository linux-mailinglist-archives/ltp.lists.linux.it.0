Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCC3B044E
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 14:25:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE94A3C9475
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 14:25:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 038A83C6FF7
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 14:25:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6C4C2600753
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 14:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624364744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=We04Wn49aHvMlnf7tvY7dQaKoeX0Vnro4ks/2lGYKlI=;
 b=Bky3C9GPiy14aHv3EUtQWc9B+1+6BGvcAk+0ZNywwweSvJslre6FzMgBrnuk2AinbGZNkR
 Npz0xSLDDsQgs+kTFlwAKGnj34xfSXfq4nw758nFjFLH6J6x/a6G7I+Xc9wdV6v5m+aI69
 Oq5jJdyVipaYEOrnliWt/fVH4g8DZYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-sJ_3rrEMNTGzl3CvY1sTpw-1; Tue, 22 Jun 2021 08:25:42 -0400
X-MC-Unique: sJ_3rrEMNTGzl3CvY1sTpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F541084F4C
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 12:25:41 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E84B1000320
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 12:25:40 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 20:25:36 +0800
Message-Id: <20210622122538.402907-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] mem: child alloc memory should larger than
 memory.max + memory.swap.max if lite==1
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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

b29tMDMgb2Z0ZW4gZ2V0cyBmYWlsIHdoaWxlIHNldHRpbmcgJ21lbW9yeS5zd2FwLm1heCA9IFRF
U1RNRU0nIGluIENHcm91cCBWMiwKYXMgaW4gdGhhdCBzY2VuYXJpbyAobGl0ZSA9PSAxKSwgY2hp
bGRfYWxsb2Mgb25seSBzdGFydCBhIHNpbmdsZSBwcm9jZXNzIHRvCmRpcnR5ICdURVNUTUVNICsg
TUInIGFub255bW91cyBtZW1vcnkgZm9yIHRlc3Rpbmc6Cgp0ZXN0b29tKCwgbGl0ZSA9PSAxLCAs
KQrCoCBvb20oLCBsaXRlID09IDEsICwpCsKgIMKgIGNoaWxkX2FsbG9jKCwgbGl0ZSA9PSAxLCkK
wqAgwqAgwqAgwqAgYWxsb2NfbWVtKFRFU1RNRU0gKyBNQiwgKQoKICBtZW0uYzoyMjQ6IFRJTkZP
OiBzdGFydCBub3JtYWwgT09NIHRlc3RpbmcuCiAgbWVtLmM6MTQ2OiBUSU5GTzogZXhwZWN0ZWQg
dmljdGltIGlzIDgwNDY2LgogIG1lbS5jOjM4OiBUSU5GTzogdGhyZWFkICg3ZjQxMWM2OWQ3NDAp
LCBhbGxvY2F0aW5nIDEwNzQ3OTA0MDAgYnl0ZXMuCiAgbWVtLmM6NjQ6IFRJTkZPOiBzd2FwcGVk
IGlzIDI1NTQ2NzUyIGJ5dGVzLiAgICAgPC0tLS0tLS0gc3dhcCBvY2N1cmluZyAtLS0tLQogIG1l
bS5jOjE2NDogVEZBSUw6IHZpY3RpbSB1bmV4cGVjdGVkbHkgZW5kZWQgd2l0aCByZXRjb2RlOiAw
LCBleHBlY3RlZDogMTIKClRCSCwgdGhpcyBjYW4gbm90IHJlYWxseSB0ZXN0IHRoZSAnbWVtb3J5
LnN3YXAubWF4JyBhcyBleHBlY3RlZCwgc2luY2UgaW4gdGhlCmtlcm5lbCBzaWRlIG1lbV9jZ3Jv
dXBfb3V0X29mX21lbW9yeSBzcGxpdCBPT00gbWFyZ2luIGludG8gdHdvLXBhcnQsIG9uZSBmb3IK
bWVtb3J5Lm1heCBsaW1pdCwgYW5vdGhlciBmb3IgbWVtb3J5LnN3YXAubWF4LCBpZiBhbnkgb2Yg
dGhlbSBnZXQgb3ZlcmZsb3csCnRoZW4gaW52b2tlIG91dF9vZl9tZW1vcnkgdG8ga2lsbCB2aWN0
aW0tcHJvY2Vzcy4KClRoZW9yZXRpY2FsbHksIGFsbG9jX21lbShURVNUTUVNICsgTUIsICkgc2hv
dWxkIHdvcmsgd2hpbGUgJ21lbW9yeS5tYXgnIGlzIGVxdWFsCnRvIFRFU1RNRU0sIGJ1dCBDZ3Jv
dXAgdjIgdHJhY2tzIG1lbW9yeSBhbmQgc3dhcCBpbiBzZXBhcmF0ZSwgd2hpY2ggc3BsaXRzIG1l
bW9yeQphbmQgc3dhcCBjb3VudGVyLiBTbyB3aXRoIHN3YXBwaW5lc3MgZW5hYmxlIChkZWZhdWx0
IHZhbHVlIGlzIDYwIG9uIFJIRUwpLCBpdApsaWtlbHkgaGFzIHBhcnQgb2YgbWVtb3J5IHN3YXBw
aW5nIG91dCBkdXJpbmcgdGhlIGFsbG9jYXRpbmcsIHVwb24gdGhhdCB0aGUgdHdvCmxpbWl0IGxv
c3MgZWZmZWN0IGF0IHRoZSBzYW1lIHRpbWUuIFVubGVzcyBkaXNhYmxlIHN3YXAgY29tcGxldGVs
eSB0aGVuIG1lbW9yeS5tYXgKd2lsbCB0YWtlIGVmZmVjdCBpbiBwcmVjaXNlbHkuCgpUbyBnZXQg
bW9yZSBvcHBvcnR1bml0aWVzIHRvIHJlYWNoIHRoZSBzd2FwIGxpbWl0YXRpb24sIGxldCdzIHNj
YWxlIGRvd24gdGhlCnZhbHVlIG9mICdtZW1vcnkuc3dhcC5tYXgnIHRvIG9ubHkgMU1CIGZvciBD
R3JvdXAgdjIuCgpCdXQgZm9yIENHcm91cCB2MSwgdGhlIG1lbW9yeS5tZW1zdy5saW1pdF9pbl9i
eXRlcyBkaXNhbGxvdyB0byBsZXNzIHRoYW4KbWVtb3J5LmxpbWl0X2luX2J5dGVzLCBzbyB3ZSdk
IGJldHRlciByYWlzZSB0aGUgY2hpbGRfYWxsb2MgdG8gdGhlIHR3aWZvbGQKb2YgVEVTVE1FTS4K
ClNpZ25lZC1vZmYtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgog
ICAgdjEgLS0+IHYyCiAgICAgICAqIGFkZCBjb21tZW50cyBmb3IgZXhwbGFpbmluZyB3aHkgc2V0
ICdtZW1vcnkuc3dhcC5tYXgnIHRvIDFNQgogICAgICAgKiBTY2FsZSBkb3duIHRoZSB2YWx1ZSBv
ZiAnbWVtb3J5LnN3YXAubWF4JyB0byBvbmx5IDFNQiBmb3IgQ0dyb3VwIHYyLgoKIHRlc3RjYXNl
cy9rZXJuZWwvbWVtL2xpYi9tZW0uYyAgIHwgIDIgKy0KIHRlc3RjYXNlcy9rZXJuZWwvbWVtL29v
bS9vb20wMy5jIHwgMTcgKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L21lbS9saWIvbWVtLmMgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9saWIvbWVtLmMKaW5kZXggOWY5
NDZiNWM5Li5hYzg5MDQ5MWMgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2xpYi9t
ZW0uYworKysgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9saWIvbWVtLmMKQEAgLTc4LDcgKzc4LDcg
QEAgc3RhdGljIHZvaWQgY2hpbGRfYWxsb2MoaW50IHRlc3RjYXNlLCBpbnQgbGl0ZSwgaW50IHRo
cmVhZHMpCiAJcHRocmVhZF90ICp0aDsKIAogCWlmIChsaXRlKSB7Ci0JCWludCByZXQgPSBhbGxv
Y19tZW0oVEVTVE1FTSArIE1CLCB0ZXN0Y2FzZSk7CisJCWludCByZXQgPSBhbGxvY19tZW0oVEVT
VE1FTSAqIDIgKyBNQiwgdGVzdGNhc2UpOwogCQlleGl0KHJldCk7CiAJfQogCmRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL21lbS9vb20vb29tMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVt
L29vbS9vb20wMy5jCmluZGV4IDkzOTQxMzc0NC4uODlkNzcxMWE1IDEwMDY0NAotLS0gYS90ZXN0
Y2FzZXMva2VybmVsL21lbS9vb20vb29tMDMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9v
b20vb29tMDMuYwpAQCAtNDYsNyArNDYsMjIgQEAgc3RhdGljIHZvaWQgdmVyaWZ5X29vbSh2b2lk
KQogCXRlc3Rvb20oMCwgMCwgRU5PTUVNLCAxKTsKIAogCWlmIChTQUZFX0NHUk9VUF9IQVMoY2cs
ICJtZW1vcnkuc3dhcC5tYXgiKSkgewotCQlTQUZFX0NHUk9VUF9QUklOVEYoY2csICJtZW1vcnku
c3dhcC5tYXgiLCAiJWx1IiwgVEVTVE1FTSk7CisJCS8qCisJCSAqIENncm91cCB2MiB0cmFja3Mg
bWVtb3J5IGFuZCBzd2FwIGluIHNlcGFyYXRlLCB3aGljaCBzcGxpdHMKKwkJICogbWVtb3J5IGFu
ZCBzd2FwIGNvdW50ZXIuIFNvIHdpdGggc3dhcHBpbmVzcyBlbmFibGUgKGRlZmF1bHQKKwkJICog
dmFsdWUgaXMgNjAgb24gUkhFTCksIGl0IGxpa2VseSBoYXMgcGFydCBvZiBtZW1vcnkgc3dhcHBp
bmcKKwkJICogb3V0IGR1cmluZyB0aGUgYWxsb2NhdGluZywgdXBvbiB0aGF0IHRoZSB0d28gbGlt
aXQgbG9zcworCQkgKiBlZmZlY3QgYXQgdGhlIHNhbWUgdGltZS4KKwkJICoKKwkJICogVG8gZ2V0
IG1vcmUgb3Bwb3J0dW5pdGllcyB0byByZWFjaCB0aGUgc3dhcCBsaW1pdGF0aW9uLAorCQkgKiBs
ZXQncyBzY2FsZSBkb3duIHRoZSB2YWx1ZSBvZiAnbWVtb3J5LnN3YXAubWF4JyB0byBvbmx5CisJ
CSAqIDFNQiBmb3IgQ0dyb3VwIHYyLgorCQkgKi8KKwkJaWYgKFRTVF9DR1JPVVBfVkVSKGNnLCAi
bWVtb3J5IikgIT0gVFNUX0NHUk9VUF9WMSkKKwkJCVNBRkVfQ0dST1VQX1BSSU5URihjZywgIm1l
bW9yeS5zd2FwLm1heCIsICIlbHUiLCBNQik7CisJCWVsc2UKKwkJCVNBRkVfQ0dST1VQX1BSSU5U
RihjZywgIm1lbW9yeS5zd2FwLm1heCIsICIlbHUiLCBURVNUTUVNKTsKKwogCQl0ZXN0b29tKDAs
IDEsIEVOT01FTSwgMSk7CiAJfQogCi0tIAoyLjMxLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
