Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A003CFCEA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 17:05:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B279F3C81ED
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 17:05:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A8EA33C2090
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 17:05:28 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6BFDF1400E0E
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 17:05:27 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 719D1400FC
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626793526;
 bh=KTu0Qj7Jz15SFKc4itqrIPw8ZfrS6SiwNXRQZtQaCJg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=aXhYsepAUeqQ91+KeEu61/d/vH+LLPcBzPQPTy/ZJxUk0KDKqkzSpZyEkMsiGNoGa
 KLjkzR+sQBSGN4BGwUTvGNbEEio02/uuKzJn4uHIU+ugb1GRCLphyJ2Wkm/UTHYIEL
 7kGfb4T32mU3C+YOXoheFDaxd8AVSZXMxae1hn0McUMf2EUrIXeFToNK6FdPqFmfYj
 /sOhtBabO0zzdqgyEFCyOBc1O9Rq9GB2H/oKlPMHfXRj83PQRqBrvRnNf+32zF30pk
 ffYShEK+nc4X2IezBgJSQ+z5HWTdxLvONc3tYL8UuyVhzb78aLA78UPB6ogRAKRy+B
 RyZsZqMHtJlhg==
Received: by mail-ej1-f70.google.com with SMTP id
 p20-20020a1709064994b02903cd421d7803so6928194eju.22
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 08:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTu0Qj7Jz15SFKc4itqrIPw8ZfrS6SiwNXRQZtQaCJg=;
 b=SUWD/fNUD7Etr8N/tKJ8EOq1Li6T5O7p75jBMMUbpVgzKCaPGILrwcgyc0gwpShcZX
 o2BpjL1M3l7WjrOHGeXP2dQ7FS0/k/CKTQOPPqQQ0Q5yhWq4XXeArqTyzMSYkDFZTwhK
 9SK+xLLSnG6gRj6sLT//p/XDe/2jcGfz60wJhFCdD72BlUFHbDE+/XoPyGJdo8McauOK
 +/v8kureoD4WWNsmfn/hcN6UctbwhDCsVaZSjYq+Ky0/AGs6pzeO4Q7nyVCsS/S8oVjB
 VUjZAe6xXq6td3zrNrIv3e/aXAT4XIwgVCLASNdS8ylxOIQVl0V+SyDXVrbJEmMDEf5s
 i2Lg==
X-Gm-Message-State: AOAM532vLZXv/GZNxZUvDTvlIwBPBshIL9EzP/XNCzVUS0DguvtH6daA
 spt+nesoEeuPYqg2hsFWiZWX3yQpqNN7O1hl+nD19acuPb+CO8OCoTe0erYpU8uqyELQiT7Zt5U
 27jw4o2L1hdu1JC7ga8FgnJPheshl
X-Received: by 2002:a17:906:c354:: with SMTP id
 ci20mr33033095ejb.435.1626793525657; 
 Tue, 20 Jul 2021 08:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6PYinqc+5DlKTTpLz+Dn7RCUoISXriIDQ6C8pBlc/Z3eSPxDTgKvJQ0+0gDhEVjRzM83ywQ==
X-Received: by 2002:a17:906:c354:: with SMTP id
 ci20mr33033066ejb.435.1626793525406; 
 Tue, 20 Jul 2021 08:05:25 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
 by smtp.gmail.com with ESMTPSA id h8sm7455129ejj.22.2021.07.20.08.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:05:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 17:05:20 +0200
Message-Id: <20210720150520.17612-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers: detect previous test failure on cgroup
 mounts
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

VGhlIGZhaWx1cmUgb2YgbWVtY2dfc3RyZXNzX3Rlc3Quc2ggY2xlYW51cCB3ZW50IHVubm90aWNl
ZCAoZXhjZXB0CmVjaG8gbWVzc2FnZSkgYW5kIGNhdXNlZCBmdXJ0aGVyIGNncm91cF9maiBhbmQg
bWVtY2dfY29udHJvbF90ZXN0CmZhaWx1cmVzIGJlY2F1c2Ugb2YgdW5jbGVhbiBjZ3JvdXBzLiBG
bG93IGlzIHVzdWFsbHkgbGlrZToKCjEuIG1lbWNnX3N0cmVzc190ZXN0IHN1Y2NlZWRzIGJ1dCBh
Y3R1YWxseSB0aGUgL2Rldi9tZW1jZyB3YXMgbm90CiAgIGNsZWFuZWQgdXAuIE5vdGljZSBsYWNr
IG9mIGFueSBlcnJvciBtZXNzYWdlIGR1ZSB0byAyPi9kZXYvbnVsbC4KCiAgICAgbWVtY2dfc3Ry
ZXNzX3Rlc3QgMSBUSU5GTzogVGVzdGluZyAxNTAgY2dyb3VwcywgdXNpbmcgMTI3MyBNQiwgaW50
ZXJ2YWwgNQogICAgIG1lbWNnX3N0cmVzc190ZXN0IDEgVElORk86IFN0YXJ0aW5nIGNncm91cHMK
ICAgICBtZW1jZ19zdHJlc3NfdGVzdCAxIFRJTkZPOiBUZXN0aW5nIGNncm91cHMgZm9yIDkwMHMK
ICAgICBtZW1jZ19zdHJlc3NfdGVzdCAxIFRJTkZPOiBLaWxsaW5nIGdyb3VwcwogICAgIHRhZz1t
ZW1jZ19zdHJlc3Mgc3RpbWU9MTYyNjc3MDc4NyBkdXI9OTAzIGV4aXQ9ZXhpdGVkIHN0YXQ9MiBj
b3JlPW5vIGN1PTE5IGNzPTEyCgoyLiBtZW1jZ19jb250cm9sX3Rlc3QgaGFzIGZhbHNlLXBvc2l0
aXZlLiBJdCBzdWNjZWVkcyBidXQgYWN0dWFsbHkgbm8KICAgdGVzdCB3YXMgZG9uZSBkdWUgdG8g
L2Rldi9tZW1jZyBwb2xsdXRpb24gZnJvbSBwcmV2aW91cyB0ZXN0OgoKICAgICBta2RpcjogY2Fu
bm90IGNyZWF0ZSBkaXJlY3Rvcnkg4oCYL3RtcC9sdHAtcThEalNoUEplQi9tbnQvMeKAmTogRmls
ZSBleGlzdHMKICAgICBtZW1jZ19jb250cm9sICAgIDAgIFRJTkZPICA6ICBUZXN0ICMxOiBDaGVj
a2luZyBpZiB0aGUgbWVtb3J5IHVzYWdlIGxpbWl0IGltcG9zZWQgYnkgdGhlIHRvcG1vc3QgZ3Jv
dXAgaXMgZW5mb3JjZWQKICAgICBzaDogZWNobzogSS9PIGVycm9yCiAgICAgL29wdC9sdHAvdGVz
dGNhc2VzL2Jpbi9tZW1jZ19jb250cm9sX3Rlc3Quc2g6IDg2OiAvb3B0L2x0cC90ZXN0Y2FzZXMv
YmluL21lbWNnX2NvbnRyb2xfdGVzdC5zaDogY2Fubm90IGNyZWF0ZSAvdG1wL2x0cC1xOERqU2hQ
SmVCL21udC8xL21lbW9yeS5tZW1zdy5saW1pdF9pbl9ieXRlczoKICAgICBQZXJtaXNzaW9uIGRl
bmllZAogICAgIHJtZGlyOiBmYWlsZWQgdG8gcmVtb3ZlICdzdWInOiBEZXZpY2Ugb3IgcmVzb3Vy
Y2UgYnVzeQogICAgIHJtZGlyOiBmYWlsZWQgdG8gcmVtb3ZlICcvdG1wL2x0cC1xOERqU2hQSmVC
L21udC8xJzogRGV2aWNlIG9yIHJlc291cmNlIGJ1c3kKICAgICBtZW1jZ19jb250cm9sICAgIDEg
IFRQQVNTICA6ICBtZW1jZ19jb250cm9sOiBwYXNzZWQKICAgICB0YWc9bWVtY2dfY29udHJvbCBz
dGltZT0xNjI2NzcxNjk1IGR1cj02IGV4aXQ9ZXhpdGVkIHN0YXQ9MCBjb3JlPW5vIGN1PTIgY3M9
MQoKMy4gY2dyb3VwX2ZqX2Z1bmN0aW9uMl9tZW1vcnkgZmFpbHMgd2l0aCBhIGNyeXB0aWMgbWVz
c2FnZSBvZiBtb3VudGluZyBhCiAgIHBhdGggd2l0aCBuZXcgbGluZSAoYmVjYXVzZSAvZGV2L21l
bWNnIHdhcyBub3QgY2xlYW5lZCB1cCBiZWZvcmUpOgoKICAgICBjZ3JvdXBfZmpfZnVuY3Rpb24y
X21lbW9yeSAxIFRJTkZPOiBTdWJzeXN0ZW0gbWVtb3J5IGlzIG1vdW50ZWQgYXQgL3N5cy9mcy9j
Z3JvdXAvbWVtb3J5CiAgICAgL2Rldi9tZW1jZwogICAgIG1rZGlyOiBjYW5ub3QgY3JlYXRlIGRp
cmVjdG9yeSDigJgvc3lzL2ZzL2Nncm91cC9tZW1vcnnigJk6IEZpbGUgZXhpc3RzCiAgICAgY2dy
b3VwX2ZqX2Z1bmN0aW9uMl9tZW1vcnkgMSBUQlJPSzogbWtkaXIgL3N5cy9mcy9jZ3JvdXAvbWVt
b3J5CiAgICAgL2Rldi9tZW1jZy9sdHAgZmFpbGVkCiAgICAgY2dyb3VwX2ZqX2Z1bmN0aW9uMl9t
ZW1vcnkgMSBUSU5GTzogUmVtb3ZpbmcgYWxsIGx0cCBzdWJncm91cHMuLi4KICAgICBmaW5kOiDi
gJgvc3lzL2ZzL2Nncm91cC9tZW1vcnlcbi9kZXYvbWVtY2cvbHRwL+KAmTogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQoKVGhlIGFjdHVhbCBmYWlsdXJlIHdhcyBpbiBtZW1jZ19zdHJlc3NfdGVz
dCBleGVjdXRlZCBiZWZvcmUgb3RoZXIgdGVzdHMsCmhvd2V2ZXIgaXQgd2VudCB1bm5vdGljZWQu
ICBEZWJ1Z2dpbmcgc3VjaCBmYWlsdXJlcyBpcyBkaWZmaWN1bHQgYXMKcmVzdWx0IG9mIGZhaWxp
bmcgdGVzdCBkZXBlbmRzIG9uIHJ1bm5pbmcgYW5vdGhlciB3aGljaCBkaWQgbm90IGZhaWwuCklu
c3RlYWQsIGRldGVjdCB1bmNsZWFuIGNncm91cHMgbW91bnRzIGFuZCBleHBsaWNpdGx5IHRlc3Qg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGNhbm9uaWNhbC5jb20+Ci0tLQogLi4uL2tlcm5lbC9jb250cm9sbGVycy9jZ3JvdXBfZmov
Y2dyb3VwX2ZqX2NvbW1vbi5zaCAgIHwgIDQgKystLQogLi4uL2NvbnRyb2xsZXJzL21lbWNnL2Nv
bnRyb2wvbWVtY2dfY29udHJvbF90ZXN0LnNoICAgIHwgMTAgKysrKysrLS0tLQogLi4uL2NvbnRy
b2xsZXJzL21lbWNnL3N0cmVzcy9tZW1jZ19zdHJlc3NfdGVzdC5zaCAgICAgIHwgIDggKysrKy0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jZ3JvdXBfZmovY2dyb3Vw
X2ZqX2NvbW1vbi5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY2dyb3VwX2ZqL2Nn
cm91cF9mal9jb21tb24uc2gKaW5kZXggNTU5NGZlOWRlNDI2Li41M2FiNjM3ZTg5MTAgMTAwNzU1
Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY2dyb3VwX2ZqL2Nncm91cF9mal9j
b21tb24uc2gKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jZ3JvdXBfZmovY2dy
b3VwX2ZqX2NvbW1vbi5zaApAQCAtMTIzLDEwICsxMjMsMTAgQEAgY2xlYW51cCgpCiAgICAgZmkK
IAogICAgIGlmIGdyZXAgLXEgIiRtb3VudF9wb2ludCIgL3Byb2MvbW91bnRzOyB0aGVuCi0gICAg
ICAgIHVtb3VudCAiJG1vdW50X3BvaW50IgorICAgICAgICBFWFBFQ1RfUEFTUyB1bW91bnQgIiRt
b3VudF9wb2ludCIKICAgICBmaQogCiAgICAgaWYgWyAtZSAiJG1vdW50X3BvaW50IiBdOyB0aGVu
Ci0gICAgICAgIHJtZGlyICIkbW91bnRfcG9pbnQiCisgICAgICAgIEVYUEVDVF9QQVNTIHJtZGly
ICIkbW91bnRfcG9pbnQiCiAgICAgZmkKIH0KZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
Y29udHJvbGxlcnMvbWVtY2cvY29udHJvbC9tZW1jZ19jb250cm9sX3Rlc3Quc2ggYi90ZXN0Y2Fz
ZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2NvbnRyb2wvbWVtY2dfY29udHJvbF90ZXN0LnNo
CmluZGV4IDRkOWYxYmI1ZDU4Ni4uNjI2ZjVlNjc2ODMxIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2NvbnRyb2wvbWVtY2dfY29udHJvbF90ZXN0LnNoCisr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvY29udHJvbC9tZW1jZ19jb250
cm9sX3Rlc3Quc2gKQEAgLTUzLDYgKzUzLDggQEAgU1RBVFVTX1BJUEU9IiRUTVAvc3RhdHVzX3Bp
cGUiCiBQQVNTPTAKIEZBSUw9MQogCisuIHRlc3Quc2gKKwogIyBDaGVjayBpZiB0aGUgdGVzdCBw
cm9jZXNzIGlzIGtpbGxlZCBvbiBjcm9zc2luZyBib3VuZGFyeQogdGVzdF9wcm9jX2tpbGwoKQog
ewpAQCAtMTE4LDggKzEyMCw4IEBAIHJlc3VsdCgpCiBjbGVhbnVwKCkKIHsKIAlpZiBbIC1lICRU
U1RfUEFUSC9tbnQgXTsgdGhlbgotCQl1bW91bnQgJFRTVF9QQVRIL21udCAyPiAvZGV2L251bGwK
LQkJcm0gLXJmICRUU1RfUEFUSC9tbnQKKwkJRVhQRUNUX1BBU1MgdW1vdW50ICRUU1RfUEFUSC9t
bnQKKwkJRVhQRUNUX1BBU1Mgcm0gLXJmICRUU1RfUEFUSC9tbnQKIAlmaQogfQogCkBAIC0xMjcs
OCArMTI5LDggQEAgZG9fbW91bnQoKQogewogCWNsZWFudXAKIAotCW1rZGlyICRUU1RfUEFUSC9t
bnQKLQltb3VudCAtdCBjZ3JvdXAgLW8gbWVtb3J5IGNncm91cCAkVFNUX1BBVEgvbW50IDI+IC9k
ZXYvbnVsbAorCUVYUEVDVF9QQVNTIG1rZGlyICRUU1RfUEFUSC9tbnQKKwlFWFBFQ1RfUEFTUyBt
b3VudCAtdCBjZ3JvdXAgLW8gbWVtb3J5IGNncm91cCAkVFNUX1BBVEgvbW50IDI+IC9kZXYvbnVs
bAogCWlmIFsgJD8gLW5lIDAgXTsgdGhlbgogCQl0c3RfYnJrbSBUQlJPSyBOVUxMICJNb3VudGlu
ZyBjZ3JvdXAgdG8gdGVtcCBkaXIgZmFpbGVkIgogCQlybWRpciAkVFNUX1BBVEgvbW50CmRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL3N0cmVzcy9tZW1jZ19z
dHJlc3NfdGVzdC5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvc3RyZXNz
L21lbWNnX3N0cmVzc190ZXN0LnNoCmluZGV4IGMyNTAxZTE2NDAxOC4uOGY3YTBlYjlkYzM3IDEw
MDc1NQotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL3N0cmVzcy9tZW1j
Z19zdHJlc3NfdGVzdC5zaAorKysgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNn
L3N0cmVzcy9tZW1jZ19zdHJlc3NfdGVzdC5zaApAQCAtNDQsOCArNDQsOCBAQCBzZXR1cCgpCiBj
bGVhbnVwKCkKIHsKIAlpZiBbIC1lIC9kZXYvbWVtY2cgXTsgdGhlbgotCQl1bW91bnQgL2Rldi9t
ZW1jZyAyPiAvZGV2L251bGwKLQkJcm1kaXIgL2Rldi9tZW1jZyAyPiAvZGV2L251bGwKKwkJRVhQ
RUNUX1BBU1MgdW1vdW50IC9kZXYvbWVtY2cKKwkJRVhQRUNUX1BBU1Mgcm1kaXIgL2Rldi9tZW1j
ZwogCWZpCiB9CiAKQEAgLTUzLDggKzUzLDggQEAgZG9fbW91bnQoKQogewogCWNsZWFudXAKIAot
CW1rZGlyIC9kZXYvbWVtY2cgMj4gL2Rldi9udWxsCi0JbW91bnQgLXQgY2dyb3VwIC1vbWVtb3J5
IG1lbWNnIC9kZXYvbWVtY2cKKwlFWFBFQ1RfUEFTUyBta2RpciAvZGV2L21lbWNnCisJRVhQRUNU
X1BBU1MgbW91bnQgLXQgY2dyb3VwIC1vbWVtb3J5IG1lbWNnIC9kZXYvbWVtY2cKIH0KIAogIyAk
MSBOdW1iZXIgb2YgY2dyb3VwcwotLSAKMi4yNy4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
