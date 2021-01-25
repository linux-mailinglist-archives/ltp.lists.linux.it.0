Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E5302237
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 07:48:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC83D3C5F2E
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 07:48:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6A2A73C5F26
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 07:47:57 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 51360200A01
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 07:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611557276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vapMI4Hp+jP32Rz+5JPdbpCWaR613rsVkh46derdVZQ=;
 b=MPiK7j5C3RtUkY8ujDFZ1nFnQvzln0KteOClgInnfu0awcUl3H7BSYNvfqdr4Z+d1f5tRz
 pjZbKolyBDehI8mwLJmcmUGgkJWpaTVhbDQNT/Sw77HcWFCtNKBnmBgBePBV6Y+LjXMBmy
 dSCyIQsE3d5HDRIeNUKmvFPOANt/FMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-UVkLfB90PuSUlMjhCM9JWw-1; Mon, 25 Jan 2021 01:47:54 -0500
X-MC-Unique: UVkLfB90PuSUlMjhCM9JWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15830801AAB;
 Mon, 25 Jan 2021 06:47:53 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB45560C5F;
 Mon, 25 Jan 2021 06:47:51 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it,
	egorenar@linux.ibm.com
Date: Mon, 25 Jan 2021 06:47:47 +0000
Message-Id: <20210125064747.26759-2-liwang@redhat.com>
In-Reply-To: <20210125064747.26759-1-liwang@redhat.com>
References: <20210125064747.26759-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH RFC 2/2] swapping01: check memory swap usage per
 process
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

U2luY2UgcHJldmlvdXNseSBzd2FwcGluZzAxIHJlYWQgdGhlIHN5c3RlbSBGcmVlU3dhcCBmb3Ig
Y291bnRpbmcKdXNhZ2Ugb2Ygc3dhcC1zaXplLCB0aGF0J3Mgbm90IHByZWNpc2Ugb24gc3lzdGVt
IGVzcGVjaWFsbHkgd2l0aAplYXRpbmctbWVtb3J5IGRhZW1vbsKgaW4gdGhlIGJhY2tncm91bmQu
IE5vdywgd2UgdHJ5IHRvIGNoZWNrIHRoZQonVm1tU3dhcCcgaW4gcHJvYy9QSUQvc3RhdHVzwqBw
ZXIgcHJvY2VzcywgdG8gZ2V0IHJpZCBvZsKgdGhlIHBvdGVudGlhbAppbmZsdWVuY2UgZnJvbcKg
b3RoZXIgcHJvY2Vzc2VzwqB3aGljaCBlYXNpbHkgbGVhZHMgdG8gZmFsc2UgcG9zaXRpdmUuCgpT
aWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KQ2M6IFBldHIgVm9yZWwg
PHB2b3JlbEBzdXNlLmN6PgpDYzogQWxleGFuZGVyIEVnb3JlbmtvdiA8ZWdvcmVuYXJAbGludXgu
aWJtLmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL21lbS9zd2FwcGluZy9zd2FwcGluZzAxLmMg
fCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3N3YXBwaW5nL3N3YXBwaW5nMDEuYyBi
L3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3N3YXBwaW5nL3N3YXBwaW5nMDEuYwppbmRleCA4MTA2ZjY0
NjYuLjBmNjkzZjMxMyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9tZW0vc3dhcHBpbmcv
c3dhcHBpbmcwMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3N3YXBwaW5nL3N3YXBwaW5n
MDEuYwpAQCAtMTM3LDggKzEzNyw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3N3YXBwaW5nKHZvaWQp
CiAJCWkrKzsKIAl9CiAKLQlzd2FwX2ZyZWVfbm93ID0gU0FGRV9SRUFEX01FTUlORk8oIlN3YXBG
cmVlOiIpOwotCXN3YXBwZWQgPSBzd2FwX2ZyZWVfaW5pdCAtIHN3YXBfZnJlZV9ub3c7CisJc3dh
cHBlZCA9IFNBRkVfUkVBRF9QUk9DX1NUQVRVUyhwaWQsICJWbVN3YXA6Iik7CiAJaWYgKHN3YXBw
ZWQgPiBtZW1fb3Zlcl9tYXgpIHsKIAkJa2lsbChwaWQsIFNJR0NPTlQpOwogCQl0c3RfYnJrKFRG
QUlMLCAiaGVhdnkgc3dhcHBpbmcgZGV0ZWN0ZWQ6ICIKLS0gCjIuMjEuMwoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
