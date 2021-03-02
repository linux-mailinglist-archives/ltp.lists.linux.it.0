Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50D32A11C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:44:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E4F93C56E3
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:44:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2D7493C4EDE
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:44:23 +0100 (CET)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C0AB12348B7
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:44:22 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id h98so19903151wrh.11
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 05:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=SOyvtmlYC2JiWK8OccYE8jhkSUFTKfbs5jbxPeo2v4I=;
 b=Hj6bklq9IKR9LuJLVueBGDL0db68jy07AP+3dzmSqgTawGwMUdq6BOFzTE2iCbh6Lp
 uxQWQ6Hs2hBlQ8xfcSumF58oieQ9N6P9D8Fcf/HuF6fA8euogNfONycAWrYyaKbg/cQi
 vV2VuTkb96roEM1uL+jUsXH23/YDp2g2TnjOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=SOyvtmlYC2JiWK8OccYE8jhkSUFTKfbs5jbxPeo2v4I=;
 b=hLF7+3itVcnhp4VOf2jqmCmdaUaWOfGZkgC99Z8PmsG2Xp5ClTKSmwzMuBwZqvrt44
 L/qLVm0UIqGNSHur46nQXEGorY/7WiGA9VhTl3xB0wmx1que4nvyy8SVWm7EJDWAPjlu
 JWYZcEBvKhfcz/KsdfkG6bO1vQMriGyJ+naib8sAamqok2AycKMJeBaKDAekhl3lz66t
 jvSPvnBkgRSZOHYGXMjITLvJX/ad4doY4nxf6ldEO5bRsMpsEyVmSSW0fZP7JYnMrajC
 sgQbLJ+wk/i/Dal8pDc4Fc+ZnPmbF/LPhfBbx8xpXmHBUGerXrY8Nw4vKPr1ejH0L1Gs
 VVXg==
X-Gm-Message-State: AOAM531+MlXqgOV3e5c8tLQrmARzAR/yhX4Oeq6UJUEcxJQQeRbS5Xbg
 k2T6dipC5k8X4DHnYLvQi5d3uJd2k/CxDw==
X-Google-Smtp-Source: ABdhPJwXQvz2j4SD0X45KKuQEdzwXrfOA30Yh4BePztsXGbwQD6ZimR6AmPAckJCboFElb2Jse3Kug==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr12991358wrq.339.1614692662271; 
 Tue, 02 Mar 2021 05:44:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53?
 ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
 by smtp.gmail.com with ESMTPSA id e1sm1547307wrw.85.2021.03.02.05.44.22
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:44:22 -0800 (PST)
Message-ID: <6c83b5fc8c891046131dbe049e37357e055f706e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: LTP List <ltp@lists.linux.it>
Date: Tue, 02 Mar 2021 13:44:21 +0000
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] open_posix_testsuite/generate-makefiles.sh: Fix
 determinism issue
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

Q3VycmVudGx5IHRoZSBsaXN0IG9mIHRlc3RzIGlzIGdlbmVyYXRlZCBieSB0aGUgb3JkZXIgb2Yg
dGhlIGZpbGVzIGZvdW5kCndpdGhpbiB0aGUgZGlyZWN0b3JpZXMuIFRoaXMgcmVzdWx0cyBpbiBk
aWZmZXJlbmNlcyBpbiB0aGUgcnVuLnNoIGFuZMKgCk1ha2VmaWxlcy4gV2l0aGluIFlvY3RvIFBy
b2plY3QgdGhpcyByZXN1bHRzIGluIGRpZmZlcmluZyB0YXJnZXQKdGVzdCBwYWNrYWdlcy4gVGhl
IGZpeCBpcyBzaW1wbGUsIGp1c3Qgc29ydCB0aGUgb3V0cHV0IGZyb20gbG9jYXRlLXRlc3QuCgpT
aWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZz4KCkluZGV4OiBnaXQvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3Njcmlw
dHMvZ2VuZXJhdGUtbWFrZWZpbGVzLnNoCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGdpdC5vcmlnL3Rlc3RjYXNl
cy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zY3JpcHRzL2dlbmVyYXRlLW1ha2VmaWxlcy5zaAorKysg
Z2l0L3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zY3JpcHRzL2dlbmVyYXRlLW1ha2Vm
aWxlcy5zaApAQCAtMjQsNyArMjQsNyBAQCBnZW5lcmF0ZV9sb2NhdGVfdGVzdF9tYWtlZmlsZSgp
IHsKIAogCWVjaG8gIkdlbmVyYXRpbmcgJG1ha2V0eXBlIE1ha2VmaWxlcyIKIAotCWxvY2F0ZS10
ZXN0IC0tJG1ha2V0eXBlIHwgc2VkIC1lICdzLF4uLywsZycgPiBtYWtlLWdlbi4kbWFrZXR5cGUK
Kwlsb2NhdGUtdGVzdCAtLSRtYWtldHlwZSB8IHNlZCAtZSAncyxeLi8sLGcnIHwgc29ydCA+IG1h
a2UtZ2VuLiRtYWtldHlwZQogCiAJZ2VuZXJhdGVfbWFrZWZpbGVzIG1ha2UtZ2VuLiRtYWtldHlw
ZSAkKgogCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
