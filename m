Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28772AEDE98
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Jun 2025 15:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1751289309; h=date :
 mime-version : message-id : references : in-reply-to : to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Odr+2Iq30pW/y3BzYuaXFmEYpGw9HKMaG/+2vkRSfo8=;
 b=Zd+akyM96izVU3kCGrCSGo3LUB1bvOCbUaG7YAwatSaL6zULEhitJr8vCTKymZD0YZJR6
 cQlE7piA5v/tBm5N1zm261JyROgKeLweX8imp7EgzNHP3dczAunu9HzEo+rHiaXrszG9m8/
 VOhhX+btq/3v31wlU2GCMbt6c3gS4Z8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F94F3C5A96
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Jun 2025 15:15:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D9B9A3C5E09
 for <ltp@lists.linux.it>; Mon, 30 Jun 2025 15:13:33 +0200 (CEST)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0364D60042F
 for <ltp@lists.linux.it>; Mon, 30 Jun 2025 15:13:33 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so1784146f8f.2
 for <ltp@lists.linux.it>; Mon, 30 Jun 2025 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1751289212; x=1751894012; darn=lists.linux.it;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ixYW+3heokpzPP+5yEn8qn5NzlDEk1LiYsffNe4OJn8=;
 b=S4M8L5JfSrgsUmJJPcSF/CKeawfkP9pogwfaXw7+JiM6dmFb9V+CDvJkmfoC/QabNY
 zbPU4RRFMAR8ih2cSGH8vYSsUFf2mPViNtYKy/VkLwcP2OlyiZvnrzbG0GXzyDfollAD
 6ItOnQc8gOg/Z6CYU/LDpHNRNy4T+zyj7U5vQtrE/uyF+42poiPd0wux2wuAZwrAgwTF
 vw9E++m8zGWJ2la9wzfLAjJIW5evutfI5vBpTxXvBDYbIoMK9Ee7cntk4xLn+V4U3cYp
 VzalhcsqlS/3Kq6KQTGpjEEfC+BPlHiBfAXii3dnHr3c7wKZjZVpSPxqsDtSKtK/02G8
 G7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751289212; x=1751894012;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ixYW+3heokpzPP+5yEn8qn5NzlDEk1LiYsffNe4OJn8=;
 b=Tg9HprKWecjA8ILf6Fo+m4PM0HZxvenMtuabhtXXKUs41prrKFU/+WVhLhSdZ8+Bze
 H8+AjXzErugNRbSVK0gix6Sl7npvp7dC7Ah9QUAktqEzKQcgnW8A6oxN9pAYQYTbPoTk
 bzl9W45NubVsiczZvbHRSs4EG9c83skX+aCGeveCE6fQGCzRWYtJFoBxm0Hheh3Rrt+U
 R/6eZVHbruB5gn2rOurdk5tP8VpC5g//2xEeHSCoPOfISPX8IUx3OQVHTLnRjsb1PaHR
 rxAD5Ps6QRI5Av7NCBvFtgKnYqdaj1PpAfZVlzcEmOuHQgFmEzzgz5oGsQT3zhOHx9gX
 qQyg==
X-Gm-Message-State: AOJu0Yz2Q+sEviTCgeUz1sxm3AvzLQASezAp8Db4n/FLzIc+XiMW1nkJ
 wAcHtjbICyAQVGKeQz/ScmJEa60Ss7ARYq4/A5P11w8uOMbsxPij6CnrKD1pn//ROlkGIyP3FU/
 8TA0c
X-Gm-Gg: ASbGncs0yU3YXGHG/DLpxrvCX20p6Q19f2eZcMZimqFyMuUtHMjNxkKEoT0f4/HF0YT
 vKzqNiwcjXVrxSatgHcBM6OBCJpRvWcJcUNkKtjTG0l1MPVeMKsS5x6NVKLGKuG46RPBbI7botF
 W/OQRQ+myGlPeGaGOipd5i3JzO7vZ7XAU6EAPchsrCKVbSJHibit65HZJP+S+LZkUOjxV95/gtS
 RlCdykZqkYldrvuIpk1HzcPzWAHSEcH7q7XoC3bHZmrcSn/IT9fp8c6/cDVh1KaOdHz0oUnC/cG
 0DXOfSqUlsNPMaFerWW5lrJmQbrPtEyEZd7/jZg6VlVaI1RtMg==
X-Google-Smtp-Source: AGHT+IGdp3huNYqgnZ9UFGJ/fAoVkMtwR8vPaJr3qLbNzNGV6TTl+kGkG1xsrnSF4P5+IWBeg/tkDQ==
X-Received: by 2002:adf:9c89:0:b0:3a5:300d:ead0 with SMTP id
 ffacd0b85a97d-3a8fe5b1b0cmr9061390f8f.43.1751289211841; 
 Mon, 30 Jun 2025 06:13:31 -0700 (PDT)
Received: from localhost ([177.45.162.214])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-4a7fc57c537sm57853741cf.57.2025.06.30.06.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 06:13:31 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:13:11 -0300
MIME-Version: 1.0
Message-Id: <20250630-conversions-shmt-v2-4-6bb1bf315cce@suse.com>
References: <20250630-conversions-shmt-v2-0-6bb1bf315cce@suse.com>
In-Reply-To: <20250630-conversions-shmt-v2-0-6bb1bf315cce@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5154; i=rbm@suse.com;
 h=from:subject:message-id; bh=g3ybRzioug0kefFVvH0bS7xRvafwe1rFjxtkpmE4s5k=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBoYo1qwBFmgcRQ2VcXYfuYGxuPTvqpEcWUQE573
 Sfrb3wrsmaJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCaGKNagAKCRDJC4p8Y4ZY
 pvOCD/wNTLqZrGEyDycCUkblaSmga/3Bb9PCpv/rO70tUNF6XAYEXBIIfkfj371Fp3Ort/bsSpr
 fjAOH1VMZaQ10Bj3n5N30Sg4FAM+9Ck0tFuBXn8iq2/D1G5WsEW4YZpDKNUjNOo770nP/+7bisx
 3kQdlxdTaQmI88Mt9C36e7ruVXW1IA3uUOflBNot/N8qTvEbQuFycBgocMuNL5EovWsbylsk7PJ
 7TrCC9bDiwS6qHTX10MIYhbZPHLaLSg2Np80HPcAN6L8uXx+vDqmUZb0qy6jDZ0PlkdtnqGllQD
 EmhKyUPDuK5PYFDeCPR5t8jljv1f5avFjRYUchGYcHSIPQqpCViNJCjvZMvsAHXevB/26vv1DR8
 i0Drmo+8RBi1EFbsfP3/jav+EgQareGhaO7soEmxKN7HsTx9yJVEGA6FAzGpAHZiLEWhZclQ3a3
 tCgl+NvAnFZAqXmsN7r0Br6Z1PZ/nPBoJrxtoYVis7O/2kwCUVfK5LbdN806zMP1WU1ejT5nDyi
 mSxY+dMTvtY6UkL6xOZB7uWKIF8eB1QYdnDU7B5Nk3vBDFn/8RDgTiINlbhi9Y1QFZ3lJFGCdDk
 jXdxZXLNoF0yg05ML2fnNK4Zjcqy65yhJeQZCKupR54L/pw9OWPnxII7hyCS9aKjqeuWpjh7gOM
 /f8IX1WSjAPPaNQ==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 4/9] mem: shmt05: Convert to new API
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
bXQwNS5jIHwgMTMxICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3NobXQvTWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVs
L21lbS9zaG10L01ha2VmaWxlCmluZGV4IGU4MzE3YThhZTY0MmIwZjY5YWM1NzI4OGNiODZhMzE2
ZWMwOWM4OGQuLjM0MTRlYWRjOTk2ZDQ1Nzk5YzE5Zjk4NTY4NjQxMTg5YzVmYzYwZTMgMTAwNjQ0
Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3NobXQvTWFrZWZpbGUKKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9tZW0vc2htdC9NYWtlZmlsZQpAQCAtMjksNSArMjksNiBAQCBpbmNsdWRlICQodG9w
X3NyY2RpcikvaW5jbHVkZS9tay90ZXN0Y2FzZXMubWsKIHNobXQwMjogTFRQTERMSUJTID0gLWxs
dHBuZXdpcGMKIHNobXQwMzogTFRQTERMSUJTID0gLWxsdHBuZXdpcGMKIHNobXQwNDogTFRQTERM
SUJTID0gLWxsdHBuZXdpcGMKK3NobXQwNTogTFRQTERMSUJTID0gLWxsdHBuZXdpcGMKIAogaW5j
bHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvZ2VuZXJpY19sZWFmX3RhcmdldC5tawpkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9tZW0vc2htdC9zaG10MDUuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvbWVtL3NobXQvc2htdDA1LmMKaW5kZXggNDMwZGIyMGNkOGQwNzQ1YjBiZjVhODFiMzYw
MWUyOWVkYzAyYTg0Yy4uZThiNWQ5ZWI1M2M1YTVlNTZlNTUwNjQwZmQxZGViZjIyMzU3M2I4NCAx
MDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9tZW0vc2htdC9zaG10MDUuYworKysgYi90ZXN0
Y2FzZXMva2VybmVsL21lbS9zaG10L3NobXQwNS5jCkBAIC0xLDEyNiArMSw0MyBAQAorLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKIC8qCi0gKgotICogICBDb3B5
cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgIENvcnAuLCAyMDAyCi0g
KgotICogICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgIHlvdSBjYW4gcmVkaXN0cmli
dXRlIGl0IGFuZC9vciBtb2RpZnkKLSAqICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKLSAqICAgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKLSAq
ICAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KLSAqCi0gKiAgIFRoaXMgcHJv
Z3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAot
ICogICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7ICB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQg
d2FycmFudHkgb2YKLSAqICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElD
VUxBUiBQVVJQT1NFLiAgU2VlCi0gKiAgIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBm
b3IgbW9yZSBkZXRhaWxzLgotICoKLSAqICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKLSAqICAgYWxvbmcgd2l0aCB0aGlz
IHByb2dyYW07ICBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCi0gKiAgIEZvdW5k
YXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEg
MDIxMTAtMTMwMSBVU0EKKyAqIENvcHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBN
YWNoaW5lcyAgQ29ycC4sIDIwMDIKKyAqCTEyLzIwLzIwMDIJUG9ydCB0byBMVFAJcm9iYmlld0B1
cy5pYm0uY29tCisgKgkwNi8zMC8yMDAxCVBvcnQgdG8gTGludXgJbnNoYXJvZmZAdXMuaWJtLmNv
bQorICogQ29weXJpZ2h0IChjKSAyMDI1IFNVU0UgTExDIFJpY2FyZG8gQi4gTWFybGnDqHJlIDxy
Ym1Ac3VzZS5jb20+CiAgKi8KIAotLyogMTIvMjAvMjAwMiAgIFBvcnQgdG8gTFRQICAgICByb2Ji
aWV3QHVzLmlibS5jb20gKi8KLS8qIDA2LzMwLzIwMDEgICBQb3J0IHRvIExpbnV4ICAgbnNoYXJv
ZmZAdXMuaWJtLmNvbSAqLwotCi0vKgotICogTkFNRQotICoJCSBzaG10MDUKLSAqCi0gKiBDQUxM
UwotICoJCSBzaG1jdGwoMikgc2htZ2V0KDIpIHNobWF0KDIpCi0gKgotICogQUxHT1JJVEhNCisv
KlwKICAqIENyZWF0ZSB0d28gc2hhcmVkIG1lbW9yeSBzZWdtZW50cyBhbmQgYXR0YWNoIHRoZW0g
dG8gdGhlIHNhbWUgcHJvY2VzcwogICogYXQgdHdvIGRpZmZlcmVudCBhZGRyZXNzZXMuIFRoZSBh
ZGRyZXNzZXMgRE8gQlVNUCBpbnRvIGVhY2ggb3RoZXIuCiAgKiBUaGUgc2Vjb25kIGF0dGFjaCBz
aG91bGQgRmFpbC4KLSAqCiAgKi8KIAotI2luY2x1ZGUgPHN0ZGlvLmg+Ci0jaW5jbHVkZSA8c3lz
L3R5cGVzLmg+Ci0jaW5jbHVkZSA8c3lzL2lwYy5oPgorI2luY2x1ZGUgInRzdF90ZXN0LmgiCisj
aW5jbHVkZSAidHN0X3NhZmVfc3lzdl9pcGMuaCIKKyNpbmNsdWRlICJsaWJuZXdpcGMuaCIKICNp
bmNsdWRlIDxzeXMvc2htLmg+Ci0jaW5jbHVkZSA8c3lzL3V0c25hbWUuaD4KLSNpbmNsdWRlIDxl
cnJuby5oPgotI2luY2x1ZGUgPHRpbWUuaD4KLQotLyoqIExUUCBQb3J0ICoqLwotI2luY2x1ZGUg
InRlc3QuaCIKLQotY2hhciAqVENJRCA9ICJzaG10MDUiOwkJLyogVGVzdCBwcm9ncmFtIGlkZW50
aWZpZXIuICAgICovCi1pbnQgVFNUX1RPVEFMID0gMjsJCS8qIFRvdGFsIG51bWJlciBvZiB0ZXN0
IGNhc2VzLiAqLwotLyoqKioqKioqKioqKioqLwogCi1rZXlfdCBrZXlbMl07CisjZGVmaW5lIFNI
TVNJWkUgMTYKIAotI2RlZmluZQkJIFNJWkUJCSAoMipTSE1MQkEpCi0KLXN0YXRpYyBpbnQgcm1f
c2htKGludCk7Ci0KLWludCBtYWluKHZvaWQpCitzdGF0aWMgdm9pZCBydW4odm9pZCkKIHsKIAlp
bnQgc2htaWQsIHNobWlkMTsKLQljaGFyICpjcCwgKmNwMTsKLQotCXNyYW5kNDgoKGdldHBpZCgp
IDw8IDE2KSArICh1bnNpZ25lZCl0aW1lKE5VTEwpKTsKLQotCWtleVswXSA9IChrZXlfdCkgbHJh
bmQ0OCgpOwotCWtleVsxXSA9IChrZXlfdCkgbHJhbmQ0OCgpOworCWNoYXIgKmNwOworCWtleV90
IGtleVsyXTsKIAotCWNwID0gTlVMTDsKLQljcDEgPSBOVUxMOworCWtleVswXSA9IEdFVElQQ0tF
WSgpOworCWtleVsxXSA9IEdFVElQQ0tFWSgpOwogCi0vKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8KKwlzaG1pZCA9IFNBRkVfU0hNR0VU
KGtleVswXSwgU0hNU0laRSwgSVBDX0NSRUFUIHwgMDY2Nik7CisJY3AgPSBTQUZFX1NITUFUKHNo
bWlkLCBOVUxMLCAwKTsKIAotCWlmICgoc2htaWQgPSBzaG1nZXQoa2V5WzBdLCBTSVpFLCBJUENf
Q1JFQVQgfCAwNjY2KSkgPCAwKSB7Ci0JCXBlcnJvcigic2htZ2V0Iik7Ci0JCXRzdF9yZXNtKFRG
QUlMLAotCQkJICJFcnJvcjogc2htZ2V0OiBzaG1pZCA9ICVkLCBlcnJubyA9ICVkXG4iLAotCQkJ
IHNobWlkLCBlcnJubyk7Ci0JfSBlbHNlIHsKLQkJY3AgPSBzaG1hdChzaG1pZCwgTlVMTCwgMCk7
CisJc2htaWQxID0gU0FGRV9TSE1HRVQoa2V5WzFdLCBTSE1TSVpFLCBJUENfQ1JFQVQgfCAwNjY2
KTsKKwlUU1RfRVhQX0ZBSUwoKGxvbmcpc2htYXQoc2htaWQsIGNwICsgKFNITVNJWkUgLyAyKSwg
MCksIEVJTlZBTCk7CiAKLQkJaWYgKGNwID09IChjaGFyICopLTEpIHsKLQkJCXRzdF9yZXNtKFRG
QUlMLCAic2htYXQiKTsKLQkJCXJtX3NobShzaG1pZCk7Ci0JCX0KLQl9Ci0KLQl0c3RfcmVzbShU
UEFTUywgInNobWdldCAmIHNobWF0Iik7Ci0KLS8qLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLwotCi0JaWYgKChzaG1pZDEgPSBzaG1nZXQo
a2V5WzFdLCBTSVpFLCBJUENfQ1JFQVQgfCAwNjY2KSkgPCAwKSB7Ci0JCXBlcnJvcigic2htZ2V0
MiIpOwotCQl0c3RfcmVzbShURkFJTCwKLQkJCSAiRXJyb3I6IHNobWdldDogc2htaWQxID0gJWQs
IGVycm5vID0gJWRcbiIsCi0JCQkgc2htaWQxLCBlcnJubyk7Ci0JfSBlbHNlIHsKLQkJY3AxID0g
c2htYXQoc2htaWQxLCBjcCArIChTSVpFIC8gMiksIDApOwotCQlpZiAoY3AxICE9IChjaGFyICop
LTEpIHsKLQkJCXBlcnJvcigic2htYXQiKTsKLQkJCXRzdF9yZXNtKFRGQUlMLAotCQkJCSAiRXJy
b3I6IHNobWF0OiBzaG1pZDEgPSAlZCwgYWRkcj0gJXAsIGVycm5vID0gJWRcbiIsCi0JCQkJIHNo
bWlkMSwgY3AxLCBlcnJubyk7Ci0JCX0gZWxzZSB7Ci0JCQl0c3RfcmVzbShUUEFTUywgIjJuZCBz
aG1nZXQgJiBzaG1hdCIpOwotCQl9Ci0JfQotCi0vKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi0KLQlybV9zaG0oc2htaWQpOwotCXJtX3No
bShzaG1pZDEpOwotCi0JdHN0X2V4aXQoKTsKKwlTQUZFX1NITUNUTChzaG1pZCwgSVBDX1JNSUQs
IE5VTEwpOworCVNBRkVfU0hNQ1RMKHNobWlkMSwgSVBDX1JNSUQsIE5VTEwpOwogfQogCi1zdGF0
aWMgaW50IHJtX3NobShpbnQgc2htaWQpCi17Ci0JaWYgKHNobWN0bChzaG1pZCwgSVBDX1JNSUQs
IE5VTEwpID09IC0xKSB7Ci0JCXBlcnJvcigic2htY3RsIik7Ci0JCXRzdF9icmttKFRGQUlMLAot
CQkJIE5VTEwsCi0JCQkgInNobWN0bCBGYWlsZWQgdG8gcmVtb3ZlOiBzaG1pZCA9ICVkLCBlcnJu
byA9ICVkXG4iLAotCQkJIHNobWlkLCBlcnJubyk7Ci0JfQotCXJldHVybiAoMCk7Ci19CitzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3RfYWxsID0gcnVuLAorfTsKCi0tIAoy
LjUwLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
