Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57EAEBDCC
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jun 2025 18:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1751043034; h=date :
 mime-version : message-id : references : in-reply-to : to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=+mxlkiHS2vyS1J85b8OpLUrVyS4jd1Y9OatZCwAtZiw=;
 b=GyHygzKpx0HG2Q2wqtatIRPTG7UnkXTKdMggoodDR28VGnl6Z2U/astlI1PEI+Ey9pakp
 MFhxnzA7tzHGbpcDTexFVLulHe3RVDydi2FSFQ+9dAakNxroxJfay4dUiyRsi6gqHQChu6V
 BDdtgaci3qYl9RZzx64j+7UPWN0uX3k=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A27A03C91C2
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jun 2025 18:50:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B8D273C76B8
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 18:48:21 +0200 (CEST)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 577FA200923
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 18:48:21 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so29491f8f.1
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1751042901; x=1751647701; darn=lists.linux.it;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VLKd/Ggb9mC+GtUIDAnuI0xPtSJDfZxGOWDpU4HvxtA=;
 b=FneY/UQXsRv5J7Tfsi/S0Alm2O8Q6mx35HLsUBpVl+Xu7q0U1QTiKmzTbNd0fyyd1D
 XswyV0un5zkBHXGFOpWUAsV6x3mXEnbIxKof/feZIIz1Ehwkq8scH6uUF2Aob5n4QPP5
 5EcsmF86Kg1BVCg968WCr6+V8W4TsWS075R0tdzV6wkG5xcsTe8rBFVqYp3nF3Wv+O/t
 /JLrNzTWIBM237V48gthZAWve10+2tIbZih/liJw14be3YfbeUPJuJL+de6++BXWTCoY
 5F4IrsKSpzG6gMZNIYSpWL18fnDyVedBAmpkQ9B7RA+snMtQeveWktgP8n655ANanbyR
 px9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751042901; x=1751647701;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLKd/Ggb9mC+GtUIDAnuI0xPtSJDfZxGOWDpU4HvxtA=;
 b=MZ7d9CtH/0qLnBiox+2TcwjPI2kkw8x6KzqEVeH6HlKi07Ud0ruyliNd/1CwvlH+vi
 0iJHmOnn615wfyg2tp7WZbnED3CbiIB0hMfWW2+iO+7rmGLvb1Upfskln+rgnIPlRxhF
 YWv/bGf47y2/JXMa25MGBbdQJluCKMUBYmqqoYgrUnu0mlZtYpKAGHgHT3sCNBKxRPwt
 nfqwQ6ZEQtJ4HkokE21+72yWzFUSD2nZ94nzXyH+8PrPB9AZqMjOvoDmttk9ne6fak9S
 lKD3qi8uKh4qBurnMAK81YLpcnwZAH13U69ts6yPmascUO4dM0TPQqYjxbGOZUggBKRi
 NSYg==
X-Gm-Message-State: AOJu0Yym8rE/pgnZuDrv9TZpFzHl0ClZGeCjErCjZoVJNbbeceWLgORP
 F6VajQ651vhR3dFA0h/yz1hw3lKF6QkJtpAUqLaQEbKZui9hsxu+gs1cl2hCinTydPbW+pbzT33
 ouDfe
X-Gm-Gg: ASbGnctGBwsvGKRvbd3aQtLgS8kp8TEzrncdUmlWc07MD97e8t+2WvEAR3e/4BQAMEV
 ygl8JQVB6JUe5myaeOJ4Zn9zTnzXL/6kE7ypIojqbP9amDxuXyWsEmqL9xrp2D0RtImroWin9LR
 aGvEynEQXpByNgVCrtfsGeGdwFukMpna/rEDY/LF/bXUIk9pejqMCJgq+ck+pJyZAG0RP/avc8X
 i+S9fK1r0/RPbq5DvFhaUigQZ1xs7TT3jajM1q8fMjFZoNpHh7RaAOskU4pw5nhQTY99VW6omQ/
 bOlvR9GEhbSKERIae05dsWWfSDBaUnms851mcAqFhm80m5Ch0UZE7oycm2tG
X-Google-Smtp-Source: AGHT+IH3YnNocmrDGbTixXV6mbxv7H72BuKRKtMEP42AhxgJqH4PE4WNBhXODRX951BW+/fDqZMBfw==
X-Received: by 2002:a05:6000:25ca:b0:3a4:ddd6:427f with SMTP id
 ffacd0b85a97d-3a8ff51fab7mr4101023f8f.35.1751042900603; 
 Fri, 27 Jun 2025 09:48:20 -0700 (PDT)
Received: from localhost ([177.45.162.214])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6fd772fcdb7sm23371156d6.86.2025.06.27.09.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 09:48:20 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:48:01 -0300
MIME-Version: 1.0
Message-Id: <20250627-conversions-shmt-v1-6-52449291b036@suse.com>
References: <20250627-conversions-shmt-v1-0-52449291b036@suse.com>
In-Reply-To: <20250627-conversions-shmt-v1-0-52449291b036@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5164; i=rbm@suse.com;
 h=from:subject:message-id; bh=20pdO2xa8FmL+FDHT1uRpejGej5zOHXswLCtOfFRuho=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBoXss9grJGCqvANzMXa/BfKqbDkyiSHBvNXRcau
 FsZJr03adaJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCaF7LPQAKCRDJC4p8Y4ZY
 pocsD/452KtgzotUk5Xfd4jOMIbahwbeYQBcn2KZv6CfyrKJPaN0+n3pxDCFbN/a+IKd8LjhCjA
 bYeWXh2ev2/RHsWRx07zIgUt6J81LM6Tuh5NJsqh6sw85apTQNbCuwRccN+wwxEHYNrOCTGYHlP
 RVWYPoqKp/UCIFj9AlPshvUy+x0wYj5v1dUx34d58xsb+Ftryf4QUP0zlWVdowrRDtp8ieQY4OW
 0KMbogL0JIXVSws9sbICQO2fvOstotARvnbqglaDGwLkfW1s/v3XwP6HPtlUDWiQlw1F+3GSHrI
 3PidHu5s50T+CoBvP6ZYCZBHg3dW4V9W4F+Wblq/G+KQ+JoZtVptMI9KrNK3emlauFzl09Q8njZ
 +qeHhq22wBXSMcyHF8TAoC1zojzUlCRATyIYh3u+U1CoQYcwMuWo+J5Fa5hq9V4W2R7z3h7FrdU
 DaK7Fh/bPawTa/+CAAuHSGx1EmjXLor/oSK4VdZMi1oSogtdsUnbraRmu6lnO6RpIEQKXiVtHqk
 +1DS1c5R7OCOi0OR0V+o9A6tV5oulOrMVZVatyKV7E/KJdJQYqriI/OKadHT/2dq5nFHTvH2vI+
 6aDvpjva78S7Oklabu3b/QLhwucUyT0OpjfSM1BobtgBXQ4d63ejNrvqWDh7BwKjOG4NLwpiE4N
 /3qU0+n04O/z/dg==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 6/9] mem: shmt07: Convert to new API
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
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_via_ltp?= <ltp@lists.linux.it>
Reply-To: =?utf-8?B?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Cc: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

RnJvbTogUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFJpY2FyZG8gQi4gTWFybGnDqHJlIDxyYm1Ac3VzZS5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5l
bC9tZW0vc2htdC9NYWtlZmlsZSB8ICAgMSArCiB0ZXN0Y2FzZXMva2VybmVsL21lbS9zaG10L3No
bXQwNy5jIHwgMTM3ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMTEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3NobXQvTWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVs
L21lbS9zaG10L01ha2VmaWxlCmluZGV4IDM0MTRlYWRjOTk2ZDQ1Nzk5YzE5Zjk4NTY4NjQxMTg5
YzVmYzYwZTMuLjJjZDY0MGEzMDBlNTNjMmRkMmNjY2JlMTQ3MDE1Nzc5ODdkMGUxMGIgMTAwNjQ0
Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3NobXQvTWFrZWZpbGUKKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9tZW0vc2htdC9NYWtlZmlsZQpAQCAtMzAsNSArMzAsNiBAQCBzaG10MDI6IExUUExE
TElCUyA9IC1sbHRwbmV3aXBjCiBzaG10MDM6IExUUExETElCUyA9IC1sbHRwbmV3aXBjCiBzaG10
MDQ6IExUUExETElCUyA9IC1sbHRwbmV3aXBjCiBzaG10MDU6IExUUExETElCUyA9IC1sbHRwbmV3
aXBjCitzaG10MDc6IExUUExETElCUyA9IC1sbHRwbmV3aXBjCiAKIGluY2x1ZGUgJCh0b3Bfc3Jj
ZGlyKS9pbmNsdWRlL21rL2dlbmVyaWNfbGVhZl90YXJnZXQubWsKZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvbWVtL3NobXQvc2htdDA3LmMgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9zaG10
L3NobXQwNy5jCmluZGV4IDA2NDM0M2Y1ZDgyN2QzNDcwMzUzNzcxZGY0MmQzNzAwNmEyYzg3Nzku
LmI2ZGQyMzRiOGJhZmJlZDdlYzM5OWUyNjU0ZjFmNWQ1OWE1NGU5ZTcgMTAwNjQ0Ci0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvbWVtL3NobXQvc2htdDA3LmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9t
ZW0vc2htdC9zaG10MDcuYwpAQCAtMSwxMzEgKzEsNDggQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCiAvKgotICoKLSAqICAgQ29weXJpZ2h0IChjKSBJbnRl
cm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzICBDb3JwLiwgMjAwMgotICoKLSAqICAgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7ICB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3Ig
bW9kaWZ5Ci0gKiAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Ci0gKiAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCi0gKiAgIChhdCB5b3VyIG9w
dGlvbikgYW55IGxhdGVyIHZlcnNpb24uCi0gKgotICogICBUaGlzIHByb2dyYW0gaXMgZGlzdHJp
YnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKLSAqICAgYnV0IFdJVEhP
VVQgQU5ZIFdBUlJBTlRZOyAgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCi0g
KiAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4g
IFNlZQotICogICB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWls
cy4KLSAqCi0gKiAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlCi0gKiAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyAgaWYg
bm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQotICogICBGb3VuZGF0aW9uLCBJbmMuLCA1
MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNB
CisgKiBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgIENvcnAu
LCAyMDAyCisgKgkxMi8yMC8yMDAyCVBvcnQgdG8gTFRQCXJvYmJpZXdAdXMuaWJtLmNvbQorICoJ
MDYvMzAvMjAwMQlQb3J0IHRvIExpbnV4CW5zaGFyb2ZmQHVzLmlibS5jb20KKyAqIENvcHlyaWdo
dCAoYykgMjAyNSBTVVNFIExMQyBSaWNhcmRvIEIuIE1hcmxpw6hyZSA8cmJtQHN1c2UuY29tPgog
ICovCiAKLS8qIDEyLzIwLzIwMDIgICBQb3J0IHRvIExUUCAgICAgcm9iYmlld0B1cy5pYm0uY29t
ICovCi0vKiAwNi8zMC8yMDAxICAgUG9ydCB0byBMaW51eCAgIG5zaGFyb2ZmQHVzLmlibS5jb20g
Ki8KLQotLyoKLSAqIE5BTUUKLSAqCXNobXQwNwotICoKLSAqIENBTExTCi0gKglzaG1jdGwoMikg
c2htZ2V0KDIpIHNobWF0KDIpCi0gKgotICogQUxHT1JJVEhNCisvKlwKICAqIENyZWF0ZSBhbmQg
YXR0YWNoIGEgc2hhcmVkIG1lbW9yeSBzZWdtZW50LCB3cml0ZSB0byBpdAogICogYW5kIHRoZW4g
Zm9yayBhIGNoaWxkLiBUaGUgY2hpbGQgdmVyaWZpZXMgdGhhdCB0aGUgc2hhcmVkIG1lbW9yeSBz
ZWdtZW50CiAgKiB0aGF0IGl0IGluaGVyaXRlZCBmcm9tIHRoZSBwYXJlbnQgY29udGFpbnMgdGhl
IHNhbWUgZGF0YSB0aGF0IHdhcyBvcmlnaW5hbGx5CiAgKiB3cml0dGVuIHRvIGl0IGJ5IHRoZSBw
YXJlbnQuCi0gKgogICovCiAKLSNpbmNsdWRlIDxzdGRpby5oPgotI2luY2x1ZGUgPHN5cy90eXBl
cy5oPgotI2luY2x1ZGUgPHN5cy93YWl0Lmg+Ci0jaW5jbHVkZSA8c3lzL2lwYy5oPgotI2luY2x1
ZGUgPHN5cy9zaG0uaD4KLSNpbmNsdWRlIDxzeXMvdXRzbmFtZS5oPgotI2luY2x1ZGUgPGVycm5v
Lmg+Ci0jaW5jbHVkZSA8c3RkbGliLmg+Ci0jaW5jbHVkZSA8dW5pc3RkLmg+Ci0KLSNkZWZpbmUJ
CVNJWkUJMTYqMTAyNAorI2luY2x1ZGUgInRzdF90ZXN0LmgiCisjaW5jbHVkZSAidHN0X3NhZmVf
c3lzdl9pcGMuaCIKKyNpbmNsdWRlICJ0c3RfcmFuZF9kYXRhLmgiCisjaW5jbHVkZSAibGlibmV3
aXBjLmgiCiAKLS8qKiBMVFAgUG9ydCAqKi8KLSNpbmNsdWRlICJ0ZXN0LmgiCisjZGVmaW5lIFNI
TVNJWkUgMTYKIAotY2hhciAqVENJRCA9ICJzaG10MDciOwkJLyogVGVzdCBwcm9ncmFtIGlkZW50
aWZpZXIuICAgICovCi1pbnQgVFNUX1RPVEFMID0gMjsJCS8qIFRvdGFsIG51bWJlciBvZiB0ZXN0
IGNhc2VzLiAqLwotLyoqKioqKioqKioqKioqLworI2luY2x1ZGUgInRzdF90ZXN0LmgiCiAKLWlu
dCBjaGlsZCgpOwotc3RhdGljIGludCBybV9zaG0oaW50KTsKLQotaW50IG1haW4odm9pZCkKK3N0
YXRpYyB2b2lkIHJ1bih2b2lkKQogewotCWNoYXIgKmNwID0gTlVMTDsKLQlpbnQgc2htaWQsIHBp
ZCwgc3RhdHVzOworCWNoYXIgKmNwOworCWludCBzaG1pZDsKIAlrZXlfdCBrZXk7CiAKLQlrZXkg
PSAoa2V5X3QpIGdldHBpZCgpOwotCi0vKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi0KLQllcnJubyA9IDA7Ci0KLQlpZiAoKHNobWlk
ID0gc2htZ2V0KGtleSwgU0laRSwgSVBDX0NSRUFUIHwgMDY2NikpIDwgMCkgewotCQlwZXJyb3Io
InNobWdldCIpOwotCQl0c3RfYnJrbShURkFJTCwgTlVMTCwKLQkJCSAiRXJyb3I6IHNobWdldDog
c2htaWQgPSAlZCwgZXJybm8gPSAlZCIsCi0JCQkgc2htaWQsIGVycm5vKTsKLQl9Ci0JY3AgPSBz
aG1hdChzaG1pZCwgTlVMTCwgMCk7Ci0KLQlpZiAoY3AgPT0gKGNoYXIgKiktMSkgewotCQlwZXJy
b3IoInNobWF0Iik7Ci0JCXRzdF9yZXNtKFRGQUlMLAotCQkJICJFcnJvcjogc2htYXQ6IHNobWlk
ID0gJWQsIGVycm5vID0gJWQiLAotCQkJIHNobWlkLCBlcnJubyk7Ci0JCXJtX3NobShzaG1pZCk7
Ci0JCXRzdF9leGl0KCk7Ci0JfQotCi0JKmNwID0gJzEnOwotCSooY3AgKyAxKSA9ICcyJzsKLQot
CXRzdF9yZXNtKFRQQVNTLCAic2htZ2V0LHNobWF0Iik7CisJa2V5ID0gR0VUSVBDS0VZKCk7CiAK
LS8qLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSovCisJc2htaWQgPSBTQUZFX1NITUdFVChrZXksIFNITVNJWkUsIElQQ19DUkVBVCB8IDA2NjYp
OworCWNwID0gU0FGRV9TSE1BVChzaG1pZCwgTlVMTCwgMCk7CisJbWVtY3B5KGNwLCB0c3RfcmFu
ZF9kYXRhLCBTSE1TSVpFKTsKIAotCXBpZCA9IGZvcmsoKTsKLQlzd2l0Y2ggKHBpZCkgewotCWNh
c2UgLTE6Ci0JCXRzdF9icmttKFRCUk9LLCBOVUxMLCAiZm9yayBmYWlsZWQiKTsKLQotCWNhc2Ug
MDoKLQkJaWYgKCpjcCAhPSAnMScpIHsKLQkJCXRzdF9yZXNtKFRGQUlMLCAiRXJyb3I6IG5vdCAx
Iik7Ci0JCX0KLQkJaWYgKCooY3AgKyAxKSAhPSAnMicpIHsKLQkJCXRzdF9yZXNtKFRGQUlMLCAi
RXJyb3I6IG5vdCAyIik7Ci0JCX0KLQkJdHN0X2V4aXQoKTsKKwlpZiAoIVNBRkVfRk9SSygpKSB7
CisJCVRTVF9FWFBfRVFfTEkobWVtY21wKGNwLCB0c3RfcmFuZF9kYXRhLCBTSE1TSVpFKSwgMCk7
CisJCXJldHVybjsKIAl9CiAKLQkvKiBwYXJlbnQgKi8KLQl3aGlsZSAod2FpdCgmc3RhdHVzKSA8
IDAgJiYgZXJybm8gPT0gRUlOVFIpIDsKLQotCXRzdF9yZXNtKFRQQVNTLCAiY3AgJiBjcCsxIGNv
cnJlY3QiKTsKLQotLyotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSovCi0Jcm1fc2htKHNobWlkKTsKLQl0c3RfZXhpdCgpOworCVNBRkVf
U0hNQ1RMKHNobWlkLCBJUENfUk1JRCwgTlVMTCk7CiB9CiAKLXN0YXRpYyBpbnQgcm1fc2htKGlu
dCBzaG1pZCkKLXsKLQlpZiAoc2htY3RsKHNobWlkLCBJUENfUk1JRCwgTlVMTCkgPT0gLTEpIHsK
LQkJcGVycm9yKCJzaG1jdGwiKTsKLQkJdHN0X2Jya20oVEZBSUwsCi0JCQkgTlVMTCwKLQkJCSAi
c2htY3RsIEZhaWxlZCB0byByZW1vdmU6IHNobWlkID0gJWQsIGVycm5vID0gJWQiLAotCQkJIHNo
bWlkLCBlcnJubyk7Ci0JfQotCXJldHVybiAoMCk7Ci19CitzdGF0aWMgc3RydWN0IHRzdF90ZXN0
IHRlc3QgPSB7CisJLnRlc3RfYWxsID0gcnVuLAorCS5mb3Jrc19jaGlsZCA9IDEsCit9OwoKLS0g
CjIuNTAuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
