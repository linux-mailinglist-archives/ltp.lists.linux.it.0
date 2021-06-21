Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA263AE7F6
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:15:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC8BF3C7037
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:15:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EBFEF3C2409
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:15:15 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6DA3B1000A21
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:15:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624274114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0tnB9f+HXPSqf94fpwah2JGK/61icyvvdWnRxQ4mR3U=;
 b=W97os5mrsOv1Exy3fJeIjiu2aOvCqVElgAaU/1Ul7oOuIRhNqnJZ7SkfrnbAwyEffDXZi6
 boa/vbxbwcqtIK7gTZAlR94S+OeE3Le9/F8n21UMcoFUNt4b9WlIszWhNQE7Rm3LyG80V9
 xW9Knr4dKUIsaSVkW+hh1JX/NHqC5qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-bP3yQBU0N02rm67VeZ-H0Q-1; Mon, 21 Jun 2021 07:15:12 -0400
X-MC-Unique: bP3yQBU0N02rm67VeZ-H0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 975A4100C660
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:15:11 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1FB560843
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:15:10 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 21 Jun 2021 19:15:08 +0800
Message-Id: <20210621111509.358656-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] mem: child memory alloc should larger than
 memory.max+memory.swap.max if lite==1
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
U1RNRU0nIGluIENHcm91cCwKYmVjYXVzZSBpbiB0aGF0IHNjZW5hcmlvIChsaXRlID09IDEpLCBj
aGlsZF9hbGxvYyBvbmx5IHN0YXJ0IGEgc2luZ2xlIHByb2Nlc3MKdG8gZGlydHkgJ1RFU1RNRU0g
KyAxTUInIGFub255bW91cyBtZW1vcnkgZm9yIHRlc3Rpbmc6Cgp0ZXN0b29tKCwgbGl0ZSA9PSAx
LCAsKQrCoCBvb20oLCBsaXRlID09IDEsICwpCsKgIMKgIGNoaWxkX2FsbG9jKCwgbGl0ZSA9PSAx
LCkKwqAgwqAgwqAgwqAgYWxsb2NfbWVtKFRFU1RNRU0gKyBNQiwgKQoKICBtZW0uYzoyMjQ6IFRJ
TkZPOiBzdGFydCBub3JtYWwgT09NIHRlc3RpbmcuCiAgbWVtLmM6MTQ2OiBUSU5GTzogZXhwZWN0
ZWQgdmljdGltIGlzIDgwNDY2LgogIG1lbS5jOjM4OiBUSU5GTzogdGhyZWFkICg3ZjQxMWM2OWQ3
NDApLCBhbGxvY2F0aW5nIDEwNzQ3OTA0MDAgYnl0ZXMuCgogIG1lbS5jOjY0OiBUSU5GTzogc3dh
cHBlZCBpcyAyNTU0Njc1MiBieXRlcy4gIDwtLS0tLS0tLSBzd2FwIG9jY3VyaW5nIC0tLS0tCgog
IG1lbS5jOjE2NDogVEZBSUw6IHZpY3RpbSB1bmV4cGVjdGVkbHkgZW5kZWQgd2l0aCByZXRjb2Rl
OiAwLCBleHBlY3RlZDogMTIKClRCSCwgaXQgY2FuIE5PVCByZWFsbHkgdGVzdCB0aGUgbWVtb3J5
LnN3YXAubWF4IGFzIGV4cGVjdGVkLCBzaW5jZSBpbgprZXJuZWwgc2lkZSBtZW1fY2dyb3VwX291
dF9vZl9tZW1vcnkgc3BsaXQgT09NIG1hcmdpbiBpbnRvIHR3byBwYXJ0LCBvbmUKZm9yIG1lbW9y
eS5tYXggbGltaXQsIGFub3RoZXIgZm9yIG1lbW9yeS5zd2FwLm1heCwgaWYgYW55IG9mIHRoZW0g
Z2V0Cm92ZXJmbG93LCB0aGVuIGludm9sayBvdXRfb2ZfbWVtb3J5IHRvIGtpbGwgdmljdGltLXBy
b2Nlc3MuCgpUaGVvcmV0aWNhbGx5LCBhbGxvY19tZW0oVEVTVE1FTSArIE1CLCApIHNob3VsZCB3
b3JrIHdoaWxlICdtZW1vcnkubWF4JyBpcwplcXVhbCB0byBURVNUTUVNLCBidXQgd2l0aCBzd2Fw
cGluZXNzIGVuYWJsZSAoZGVmYXVsdCB2YWx1ZSBpcyA2MCBvbiBSSEVMKSwKaXQgbGlrZWx5IGhh
cyBwYXJ0IG9mIG1lbW9yeSBzd2FwcGluZyBvdXQgZHVyaW5nIHRoZSBhbGxvY2F0aW5nLCBzbyB0
aGUgdHdvCmxpbWl0IGxvc3MgZWZmZWN0IGF0IHRoZSBzYW1lIHRpbWUuICh1bmxlc3MgZGlzYWJs
ZSBzd2FwcGluZXNzIGNvbXBsZXRlbHkgdGhlbgptZW1vcnkubWF4IHdpbGwgdGFrZSBlZmZlY3Qg
aW4gcHJlY2lzZWx5KQoKVG8gc3RheSBvbiB0aGUgc2FmZSBzaWRlLCBoZXJlIHJhaXNpbmcgdGhl
IHNpbmdsZSBwcm9jZXNzIHRvIGFsbG9jIGEgYml0Cm1vcmUgbWVtb3J5IHdoaWNoIGlzIGxhcmdl
ciB0aGFuICdtZW1vcnkubWF4ICsgbWVtb3J5LnN3YXAubWF4JyAoVEVTVE1FTSAqIDIgKyAxTUIp
LAp0aGF0IHdpbGwgb2J2aW91c2x5IHdvcmsgZmluZSBpbiByZWFsIHNpdHVhdGlvbnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIFRo
aXMgaXMgZGVidWdnaW5nIGNvZGUgZm9yIHNob3dpbmcgc3dhcHBlZDoKICAgIAogICAgLS0tIGEv
dGVzdGNhc2VzL2tlcm5lbC9tZW0vbGliL21lbS5jCiAgICArKysgYi90ZXN0Y2FzZXMva2VybmVs
L21lbS9saWIvbWVtLmMKICAgIEBAIC01OSw2ICs1OSwxMCBAQCBzdGF0aWMgaW50IGFsbG9jX21l
bShsb25nIGludCBsZW5ndGgsIGludCB0ZXN0Y2FzZSkKICAgICAgICAgICAgZm9yIChpID0gMDsg
aSA8IGxlbmd0aDsgaSArPSBwYWdlc3opCiAgICAgICAgICAgICAgICAgICAgc1tpXSA9ICdcYSc7
CiAgICAKICAgICsgICAgICAgbG9uZyBzd2FwcGVkID0gU0FGRV9SRUFEX1BST0NfU1RBVFVTKGdl
dHBpZCgpLCAiVm1Td2FwOiIpOwogICAgKyAgICAgICB0c3RfcmVzKFRJTkZPLCAic3dhcHBlZCBp
cyAlbGQgYnl0ZXMuIiwgc3dhcHBlZCAqIDEwMjQpOwogICAgKwogICAgICAgICAgICByZXR1cm4g
MDsKICAgICB9CgogdGVzdGNhc2VzL2tlcm5lbC9tZW0vbGliL21lbS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9tZW0vbGliL21lbS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vbGliL21l
bS5jCmluZGV4IDlmOTQ2YjVjOS4uZWNjNjFiMjE2IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2Vy
bmVsL21lbS9saWIvbWVtLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vbGliL21lbS5jCkBA
IC03OCw3ICs3OCw3IEBAIHN0YXRpYyB2b2lkIGNoaWxkX2FsbG9jKGludCB0ZXN0Y2FzZSwgaW50
IGxpdGUsIGludCB0aHJlYWRzKQogCXB0aHJlYWRfdCAqdGg7CiAKIAlpZiAobGl0ZSkgewotCQlp
bnQgcmV0ID0gYWxsb2NfbWVtKFRFU1RNRU0gKyBNQiwgdGVzdGNhc2UpOworCQlpbnQgcmV0ID0g
YWxsb2NfbWVtKFRFU1RNRU0gKyBURVNUTUVNICsgTUIsIHRlc3RjYXNlKTsKIAkJZXhpdChyZXQp
OwogCX0KIAotLSAKMi4zMS4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
