Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C323B13E4
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 08:25:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 609BA3C6FD3
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 08:25:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01BCA3C2244
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 08:25:05 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C8BF31A0061D
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 08:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624429502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ifJLvCiq/C6b9U0bSvGpISjHn4yVd26LAqkSGAUAWcs=;
 b=bt0t46FLgJ26HpNK172CBdg3Rm/LSZR+sLQ028RIMG/4gvr+SAbrFrlIxDbElCXWMLaolr
 QXxWQO+BL37s6m/dtFsHkziuPJahv/u7fR1vPn2i/LpO0nC0+5/g7A1GV85E8cZerwC+0e
 Szxzbl+nSHoiNYhayJpbjJgRqm/Sm6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-uejA1CXTMZGu_Kl_pd5Hxw-1; Wed, 23 Jun 2021 02:25:00 -0400
X-MC-Unique: uejA1CXTMZGu_Kl_pd5Hxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733C81084F58;
 Wed, 23 Jun 2021 06:24:59 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C55A10016FE;
 Wed, 23 Jun 2021 06:24:57 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 14:24:54 +0800
Message-Id: <20210623062456.430406-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] mem: child alloc memory should larger than
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
IGJldHRlciByYWlzZSB0aGUgY2hpbGRfYWxsb2MgdG8gdGhlIHR3b2ZvbGQKb2YgVEVTVE1FTSwg
YW5kIHJlc2V0IG1lbW9yeS5tZW1zdy5saW1pdF9pbl9ieXRlcyB0byAnVEVTVE1FTSArIE1CJy4K
ClNpZ25lZC1vZmYtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgog
ICAgdjIgLS0+IHYzCiAgICAgICogc2V0IG1lbW9yeS5tZW1zdy5saW1pdF9pbl9ieXRlcyB0byBU
RVNUTUVNK01CIGFzIHN1Z2dlc3QgYnkgUmljaGFyZAogICAgICAqIHR5cG8gZml4IGFuZCBzb21l
IGNvbW1lbnRzIGVtYmVsbGlzaG1lbnQKCiB0ZXN0Y2FzZXMva2VybmVsL21lbS9saWIvbWVtLmMg
ICB8ICAyICstCiB0ZXN0Y2FzZXMva2VybmVsL21lbS9vb20vb29tMDMuYyB8IDE2ICsrKysrKysr
KysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL21lbS9saWIvbWVtLmMgYi90ZXN0Y2Fz
ZXMva2VybmVsL21lbS9saWIvbWVtLmMKaW5kZXggOWY5NDZiNWM5Li5hYzg5MDQ5MWMgMTAwNjQ0
Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2xpYi9tZW0uYworKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL21lbS9saWIvbWVtLmMKQEAgLTc4LDcgKzc4LDcgQEAgc3RhdGljIHZvaWQgY2hpbGRfYWxs
b2MoaW50IHRlc3RjYXNlLCBpbnQgbGl0ZSwgaW50IHRocmVhZHMpCiAJcHRocmVhZF90ICp0aDsK
IAogCWlmIChsaXRlKSB7Ci0JCWludCByZXQgPSBhbGxvY19tZW0oVEVTVE1FTSArIE1CLCB0ZXN0
Y2FzZSk7CisJCWludCByZXQgPSBhbGxvY19tZW0oVEVTVE1FTSAqIDIgKyBNQiwgdGVzdGNhc2Up
OwogCQlleGl0KHJldCk7CiAJfQogCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL21lbS9v
b20vb29tMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL29vbS9vb20wMy5jCmluZGV4IDkzOTQx
Mzc0NC4uYjM3NzBjZjhmIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL21lbS9vb20vb29t
MDMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9vb20vb29tMDMuYwpAQCAtNDYsNyArNDYs
MjEgQEAgc3RhdGljIHZvaWQgdmVyaWZ5X29vbSh2b2lkKQogCXRlc3Rvb20oMCwgMCwgRU5PTUVN
LCAxKTsKIAogCWlmIChTQUZFX0NHUk9VUF9IQVMoY2csICJtZW1vcnkuc3dhcC5tYXgiKSkgewot
CQlTQUZFX0NHUk9VUF9QUklOVEYoY2csICJtZW1vcnkuc3dhcC5tYXgiLCAiJWx1IiwgVEVTVE1F
TSk7CisJCS8qCisJCSAqIENncm91cCB2MiB0cmFja3MgbWVtb3J5IGFuZCBzd2FwIGluIHNlcGFy
YXRlLCB3aGljaCBzcGxpdHMKKwkJICogbWVtb3J5IGFuZCBzd2FwIGNvdW50ZXIuIFNvIHdpdGgg
c3dhcHBpbmVzcyBlbmFibGUgKGRlZmF1bHQKKwkJICogdmFsdWUgaXMgNjAgb24gUkhFTCksIGl0
IGxpa2VseSBoYXMgcGFydCBvZiBtZW1vcnkgc3dhcHBpbmcKKwkJICogb3V0IGR1cmluZyB0aGUg
YWxsb2NhdGluZy4KKwkJICoKKwkJICogVG8gZ2V0IG1vcmUgb3Bwb3J0dW5pdGllcyB0byByZWFj
aCB0aGUgc3dhcCBsaW1pdGF0aW9uLAorCQkgKiBsZXQncyBzY2FsZSBkb3duIHRoZSB2YWx1ZSBv
ZiAnbWVtb3J5LnN3YXAubWF4JyB0byBvbmx5CisJCSAqIDFNQiBmb3IgQ0dyb3VwIHYyLgorCQkg
Ki8KKwkJaWYgKFRTVF9DR1JPVVBfVkVSKGNnLCAibWVtb3J5IikgIT0gVFNUX0NHUk9VUF9WMSkK
KwkJCVNBRkVfQ0dST1VQX1BSSU5URihjZywgIm1lbW9yeS5zd2FwLm1heCIsICIlbHUiLCBNQik7
CisJCWVsc2UKKwkJCVNBRkVfQ0dST1VQX1BSSU5URihjZywgIm1lbW9yeS5zd2FwLm1heCIsICIl
bHUiLCBURVNUTUVNICsgTUIpOworCiAJCXRlc3Rvb20oMCwgMSwgRU5PTUVNLCAxKTsKIAl9CiAK
LS0gCjIuMzEuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
