Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3222A9C
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 06:17:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F36033EA3F5
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 06:17:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8103D3EA2ED
 for <ltp@lists.linux.it>; Mon, 20 May 2019 06:17:37 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 84B901000CCB
 for <ltp@lists.linux.it>; Mon, 20 May 2019 06:17:33 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id p1so689787plo.2
 for <ltp@lists.linux.it>; Sun, 19 May 2019 21:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/76Qad6SxTagxAZyr9QiyNyGHD4sSedOPZ23TPO5YB0=;
 b=FcxpX5T59ZEIHHUbkYWeCTfOJ9V+7UHLg5LmD2A2k/1Q3+X3TH+VpXnSyuudJUq1ep
 /T418SzQCVdczI3CIgqa4W8QIICV0N56lePwCAT4xgBu8mCzP7Wwd99kLfBXWxI6Zsir
 BHOsTkL3EzpMnSyqclQLLBvOxVTY4jtr8M2up/egR6H0jb6D8F74W8JPlvhrUPr5OZ+B
 CSm2BpMdm8RGKpYBAnKfwtE8WJmq01blrMnB9UnaG1+u2kyI+wSZplc6zL0y5/1K7eqP
 bxzq9tIrBxpDmyaiUSL00b3IiTljejpPr/ApNqG6uJz22Hu9nh8vXCqInhky/HES3tfk
 HzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/76Qad6SxTagxAZyr9QiyNyGHD4sSedOPZ23TPO5YB0=;
 b=VpbbwhVibNdkfwHykHk0TDUAHNDTgpQigJE3m7cfo8muFmWKtneqgiSwuweAA5clS/
 iBdOUY6OY7pewQAZk7U8xa3t3UpLWT5I58iyg9bAtjSNfIf+V6Mdj80uv6piIfIFcQNN
 G3UkhN1gR6whgiWHLiTYKQ/4ExIJfbf2zZb48KwjiBegjydaN0VzaWDn63y/rqkdvEWL
 G27kh5U+JyjdM89vgnX29M6O+wIsTR4p6nmPzc72EBId3t1Ne0Be7O09/Uavd9rgRMu7
 bM6cvloxJsdkKjLF32EENEzJoZLTy3ojl/Bp8n7uvecHBMwbboOv9719PdC7oyR8zF18
 ZaBQ==
X-Gm-Message-State: APjAAAWV0w1E2wG4lXq81mt0XhcP3LqqLpGrLRENPf63iuL1ckUzbtIu
 HyDKga4Y5OwiTG7LNK0QfVo6anM0+yLpcg==
X-Google-Smtp-Source: APXvYqzhCNZq2G9ZZtBQbBYkTOO2x922nrEug4/eRNj74gNq2nZYCYWCS7l3p6K6qqEaxsl5efC+zQ==
X-Received: by 2002:a17:902:2ba8:: with SMTP id
 l37mr52209077plb.229.1558325854910; 
 Sun, 19 May 2019 21:17:34 -0700 (PDT)
Received: from sspatil-glaptop2.corp.google.com
 ([2401:fa00:1:9:f594:8a7d:1255:de9e])
 by smtp.gmail.com with ESMTPSA id r9sm28146548pfc.173.2019.05.19.21.17.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 21:17:34 -0700 (PDT)
From: Sandeep Patil <sspatil@android.com>
To: ltp@lists.linux.it
Date: Mon, 20 May 2019 12:17:29 +0800
Message-Id: <20190520041730.28238-1-sspatil@android.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com
Subject: [LTP] [RFC PATCH 0/1] Fix return value checks for posix apis
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

VGhpcyBpcyBhbiBSRkMgcGF0Y2ggdG8gZGVtb25zdHJhdGUgdGhhdCBtb3N0IG9mIHRoZSBwdGhy
ZWFkXyogY2FsbHMKaW4gdGhlIG9wZW5fcG9zaXhfdGVzdHN1aXRlIHNlZW0gdG8gYmUgZG9pbmcg
dGhlIHJldHVybiB2YWx1ZSBjaGVja3MKaW5jb3JyZWN0bHkuIE1vc3QgcG9zaXhfKiBhcGlzIHJl
dHVybiBwb3NpdGl2ZSBlcnJubyBvbiBmYWlsdXJlIGFuZCAwIG9uCnN1Y2Nlc3MuCgpQQVRDSCAx
LzEgZGVtb25zdHJhdGVzIHRoZSBmaXhlcyBuZWVkZWQgZm9yIHB0aHJlYWRfc2lnbWFzay82LTEg
Zm9yCmV4YW1wbGUuIFRoaXMgcGF0dGVybiBpcyBmYWlybHkgd2lkZXNwcmVhZCBpbiBvcGVuX3Bv
c2l4X3Rlc3RzdWl0ZS4KCkFmdGVyIGdvaW5nIHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24gaW4g
dGhlIHByb2plY3QsIEkgd2Fzbid0IHN1cmUgaWYgSQp0ZXN0ZWQgdGhpcyBjb3JyZWN0bHkuIEFm
dGVyIGJ1aWxkaW5nLCBJIHRyaWVkIHRoZSBmb2xsb3dpbmcKCiQgY2QgdGVzdGNhc2VzL29wZW5f
cG9zaXhfdGVzdHN1aXRlCiQgLi9iaW4vcnVuX3Rlc2l0LnNoIGNvbmZvcm1hbmNlL2ludGVyZmFj
ZXMvcHRocmVhZF9zaWdtYXNrIHB0aHJlYWRfc2lnbWFza182LTEucnVuLXRlc3QKCi4uLmFuZCB0
aGF0IGtlZXBzIHJ1bm5pbmcgaW50byB0ZXN0IGJlaW5nIHNraXBwZWQgZHVlIHRvIG1pc3Npbmcg
ZmlsZS4KKEkgZG8gaGF2ZSBwdGhyZWFkX3NpZ21hc2tfNi0xLnJ1bi10ZXN0IGluIHBsYWNlKS4K
ClNvLCBjb25zaWRlciB0aGlzIGJ1aWxkIHRlc3RlZCBvbmx5IGZvciBub3cuIEknZCBsb3ZlIHRv
IGtub3cgaG93IHdlIGNhbgp0ZXN0IHRoaXMgYW5kIGlmIHdlIGFyZSBzdGlsbCB1c2luZyB0aGUg
dGVzdHN1aXRlLCB0aGVuIEkgYW0gaGFwcHkgdG8KZml4IHJlc3Qgb2YgdGhlIHBsYWNlcyB3aGVy
ZSBpdHMgYnJva2VuLgoKU2FuZGVlcCBQYXRpbCAoMSk6CiAgb3Blbl9wb3NpeF90ZXN0c3VpdGUv
cHRocmVhZF9zaWdtYXNrOiBmaXggcmV0dXJuIHZhbHVlIGNoZWNrcwoKIC4uLi9pbnRlcmZhY2Vz
L3B0aHJlYWRfc2lnbWFzay82LTEuYyAgICAgICAgICB8IDY5ICsrKysrKysrKysrLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKCi0tIAoy
LjIxLjAuMTAyMC5nZjI4MjBjZjAxYS1nb29nCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
