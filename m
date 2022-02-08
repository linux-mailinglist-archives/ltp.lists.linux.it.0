Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9354AD9B6
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Feb 2022 14:24:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A07B3C9B49
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Feb 2022 14:24:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9CC53C9B28
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 14:24:21 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 489DE1000B44
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 14:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644326659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=StyzQGQiOADtz9OWExE+VhbFO+3FaQhGSHuOl7ff9jw=;
 b=c3NelLFXEGo/KCwkRCKLg1CuQOsyb389mLO90NL9Q/OcQBtYBBnxd/BVaA1yio4U40f2IL
 g3UlhDEjc6tphL5F/hN0fmghX20oZ7MvmBnIQgvZI71mhI0uEjLXHRjSzMeJut1qw8zIEX
 240gPblMDYuSQhERm4Uqtm1NdkDG9Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-aj_Jmwy3N_yHVD_tRdXFWg-1; Tue, 08 Feb 2022 08:24:18 -0500
X-MC-Unique: aj_Jmwy3N_yHVD_tRdXFWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D63161124C40
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 13:24:17 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19DA170D23
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 13:24:16 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  8 Feb 2022 21:24:14 +0800
Message-Id: <20220208132414.2852202-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] getrusage03: mlock the memory area in consume_mb
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

U2VlbXMgaXQgdHJ5aW5nIHRvIHRlc3Qgd2l0aG91dCBzd2FwIGhhcHBlbiB0byBndWFyYW50ZWUg
bGVzcwpkaXN0dXJiaW5nIGZvciB0aGUg4oCZLT5ydV9tYXhyc3PigJggY291bnRpbmcuCgpUaGVy
ZWZvcmUgYWRkIG1sb2NrKCkgdG8gcHJldmVudCB0aGF0IG1lbW9yeSBhbGxvY2F0ZWQgYnkgY29u
c3VtZV9tYgpmcm9tIGJlaW5nIHBhZ2VkIHRvIHRoZSBzd2FwIGFyZWEuCgpTaWduZWQtb2ZmLWJ5
OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2dldHJ1c2FnZS9nZXRydXNhZ2UwMy5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJ1c2Fn
ZS9nZXRydXNhZ2UwMy5oIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRydXNhZ2UvZ2V0
cnVzYWdlMDMuaAppbmRleCBmMWJiZTliZTUuLmQ0NmZkZmY4NSAxMDA2NDQKLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9nZXRydXNhZ2UvZ2V0cnVzYWdlMDMuaAorKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2dldHJ1c2FnZS9nZXRydXNhZ2UwMy5oCkBAIC0xOCw2ICsxOCw3
IEBAIHN0YXRpYyB2b2lkIGNvbnN1bWVfbWIoaW50IGNvbnN1bWVfbnIpCiAKIAlzaXplID0gY29u
c3VtZV9uciAqIDEwMjQgKiAxMDI0OwogCXB0ciA9IFNBRkVfTUFMTE9DKHNpemUpOworCW1sb2Nr
KHB0ciwgc2l6ZSk7CiAJbWVtc2V0KHB0ciwgMCwgc2l6ZSk7CiAKIAlTQUZFX0ZJTEVfTElORVNf
U0NBTkYoIi9wcm9jL3NlbGYvc3RhdHVzIiwgIlZtU3dhcDogJWx1IiwgJnZtc3dhcF9zaXplKTsK
LS0gCjIuMzEuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
