Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3CCAEBDC7
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jun 2025 18:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1751042988; h=date :
 mime-version : message-id : references : in-reply-to : to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Odr+2Iq30pW/y3BzYuaXFmEYpGw9HKMaG/+2vkRSfo8=;
 b=a6HAFzCq+sxgHNFo9GvWTCWrFn//EBIOjr+K1g06jJOSl4y2u7kficyWbwaWXppeh6eSr
 pHQIJ3/Mrc0N+oA0PuDmFQZvvfQrzmXeVkug7oTI01GlSA+gmykRYgTTaFF04qaZSmgVZ+B
 +2JP2Y0J//8ski/twbFtch3ciEQRsTY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8CA93C9228
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jun 2025 18:49:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 07F7D3C91C2
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 18:48:16 +0200 (CEST)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7FC0F1A007F4
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 18:48:15 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso1154960f8f.0
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1751042895; x=1751647695; darn=lists.linux.it;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ixYW+3heokpzPP+5yEn8qn5NzlDEk1LiYsffNe4OJn8=;
 b=BCGPWDP+zw6dD+DFK6pl5PR5d2Dt49zyE2cNIFNVLNdbMM5X7sKVbc+ThiooMLDO7Y
 DDMgtjzkdFsaEaQED5Uj6UANO6OL0FacXbRKAhslgQi6IWTr/FIbrFyBWBV/8Nzm1dOI
 v//oZ3D4I6PyobfNxiW9h1t3nHpy5s4WP1oCgIiwc7eEwXkQailx4aBO5Dex1BIVn5Q9
 cAZbOqOUodsWc3s0DNjI304yMZB5txnFX050uffeMS+dgaQcVoAOC3r7qfHaf9Um9wBI
 MTU22rvrENKFadQIToz6qa+T1PBSqNKs3/k+L2eJrcb6p7zsfr51vdf1d+QYcqyVJW2O
 n0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751042895; x=1751647695;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ixYW+3heokpzPP+5yEn8qn5NzlDEk1LiYsffNe4OJn8=;
 b=Mwvgci65B6jyFIR791jzHt/MJASWu3TWSHdFx4B4Rl95fxlOX58tHxaKk3l3jmHN5d
 CxoTc5g+FSYmJ65N6u4DQy+hG9uTDBIOwqfS/JlLoVFFpnHE6Z8M8ZcFuA8lp0Gu8Ywe
 upNrNm47wpmg8jWNePnLeoVZOUVp0fmN0QbXFHKFUJCHQ3APomyfpUF6OXhY5v7boci/
 wH5ZJeN98DjS4LmOqz2ALrbcg77L0C5eTwJc96MaFCBwzziMfriQJrBxHPnK9LvdWiJM
 aX5UOUmOsYrq5JK2kHmTPFXfooPj9GdAbncOYJUw+6lICzOmcVNMV0jO08p1CxK6Un8D
 IddQ==
X-Gm-Message-State: AOJu0YxsLkcdVu+/Bk4tq72NAweZbb/Xy8DShJPFZfl9Fh6e4ALQOjPz
 0oiUp9Qz6dX/rmFgtOm5IZqs0J/1dvjfyxSwws2K3sVYzboAqHDPehHwKosB0ez7ShAQUB1CcUR
 K248G
X-Gm-Gg: ASbGncs8oXKI7G5XWe2nVEncXTyMM718RLtFCqIZojLWFvkfjekGHU55mvxk8hLwDCI
 8Ii+h5T9YolnaOxRa6+owiNkm97iJvHUrg2m1Fb/YCYAqJkrf23+G9AmuxvkRHGOKkjDvzJwkBR
 DjQgqKTWCXPOcWbREToTgWSfya/5e2JqODDglArwJFz+dFRVgT0/7LTv03GUn4UdA/gwP/Hf0wu
 O6+aVMgb0EsoCKnpuyis9fD4dk6xO6dlel2K3CUBWpEkkF/98u8ItUUH2MJtUTgorUqvQnHM8yt
 zaRFD2hUh48HnM9qeTYk69aQmurZau6tma3Cgm35rLCuXe3TmQ==
X-Google-Smtp-Source: AGHT+IFBb7d9fX4cLk1AI5v7h7v+Yzq/IhdHwpVXG3gisoV2mUPYN3VCRYpz6hBCloJnoaZSY8zi1Q==
X-Received: by 2002:a05:6000:646:b0:3a5:8600:7cff with SMTP id
 ffacd0b85a97d-3a8fdb2a82fmr4145224f8f.1.1751042894794; 
 Fri, 27 Jun 2025 09:48:14 -0700 (PDT)
Received: from localhost ([177.45.162.214])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-4a7fbffc2a6sm15693711cf.0.2025.06.27.09.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 09:48:14 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:47:59 -0300
MIME-Version: 1.0
Message-Id: <20250627-conversions-shmt-v1-4-52449291b036@suse.com>
References: <20250627-conversions-shmt-v1-0-52449291b036@suse.com>
In-Reply-To: <20250627-conversions-shmt-v1-0-52449291b036@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5154; i=rbm@suse.com;
 h=from:subject:message-id; bh=g3ybRzioug0kefFVvH0bS7xRvafwe1rFjxtkpmE4s5k=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBoXss95filLVB5bxDVzYWQYaeTWG9B4GTlHSPI6
 gJIqz4735KJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCaF7LPQAKCRDJC4p8Y4ZY
 plSND/9WRVte/jCEUVvTg+nYOsrTE3pAbdWNXnQttnQQDOqBSB15K/JTYxLhiGVAhGwofgF0sTa
 TAN2SHOiXAtqPXt9MQFRT05VUlvSCy57GMGEE1kWPBeeNleEvikjaKOz1tlPADVIrnLaXh/MJKn
 ukwKCfm6vgxoCJjQTN759euSDfyofkFh51k4ndNmOY6uJEs55ee6iZZDJSNJchvo7I8o+Fra0dz
 z4dzMGAY20uOUE0iq3bghkQ70+aB4qXoMqY9i2vdPbmgHA/AbP/UMynI7sx0tZrlb46gh0d0guz
 owgzoxB5uJ9/VyAj505CpOxH8RXx0LpXOA5+blpw4l6uQBxNgPsqpyzz/cXeE3rF0GQaR++W9PM
 zXYICDEsNOYrE0DMXqgYfvvnKXiUNUWsQqCRDp/TtHgWS47NpJ5DQdk4w02KUAHuxReSBA36D6t
 TVK81M2oXZ5KRbD44jVLMtWCDx913Ayl3CAlYNhehyyuGTvFfoWXrWsyku5x08uufcxr+4dBYqd
 I6AgcomjhPDvmq573U0LkBmCxKqHr50KGMsAE9Bk3m6qMombdmm+nkNjhEjmrcU+x5W9VZaF+9t
 fcdmAN+0luFr3NOGEIkNkBvKZ7H0myQb0pnpKjGcbau6t1xCMhM4pPyBOflR8x3Wo/tx2ucDtJD
 fnSrtL+aPXDBaNg==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 4/9] mem: shmt05: Convert to new API
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
