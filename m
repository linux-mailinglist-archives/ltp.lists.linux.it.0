Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D44A73470
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Mar 2025 15:30:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743085827; h=date :
 mime-version : message-id : references : in-reply-to : to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=uC65LJeLgMwEZEWSlLZ5U5ud5WFsKxS0PIb+kzJjNGQ=;
 b=pxCAZSGFBv7p/Vz2x3qu8x/Jr7uFZVWI+xXchJiJCBnL5R2pQnNDa9DQy/HUJvW60Vbmo
 iMoaRMOvyuN8++1KO72C/IZdptlqakof2Cybh9ssHSaMIDASRFJMokEHv/f6qZ04GRr9sos
 o17IT08TOOX4BYIfC+Y2ytqhqw7oARI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B8BE3C9FE0
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Mar 2025 15:30:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C34D43CA012
 for <ltp@lists.linux.it>; Thu, 27 Mar 2025 15:28:55 +0100 (CET)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4CC9520099A
 for <ltp@lists.linux.it>; Thu, 27 Mar 2025 15:28:55 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so869566f8f.3
 for <ltp@lists.linux.it>; Thu, 27 Mar 2025 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1743085735; x=1743690535; darn=lists.linux.it;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3FOq3AZbaUDmbrbdM9CDL1qmhDem894WbArYiJFMNHo=;
 b=ai1nZxrIUajoxpQbfEyoFkQPj0mIqV35VWmbaBBSDn4BeEM8BFINdQkMgwTRKyTv8D
 eWcvQLrJ3YAKFf8Cw8/0Bsw60aAxlWOLe+v0BG0r5B1cZZcs9EuFfhiKYqkZ7vHwCrgc
 V3pN5Wy5f+L7phfUK9WixAUhNF3kevceH9326fQmhNL81TjVpMBdwKze01oGDJ50SOxf
 bhEoip+tG8iedDbUpD5Q9nO8Y6hEIyGYnfbCk95r0DEKTXlyrQfsBYONFzFHTLW09oIi
 31YjlVg4ws+1avV79zpjNvPK0MewCRsmBkDbHLsqy4kz9ZMXzcaUGk9SEWaXrgtZwg2C
 deSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743085735; x=1743690535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FOq3AZbaUDmbrbdM9CDL1qmhDem894WbArYiJFMNHo=;
 b=jQES6IV00HNqtZMnS2A/JlptHjnkx9G9KT10FraWXSHV2iIVWO1qvqNVIo3P4WCiLG
 3bDmrdk5AddFLcliWCy+Xpq3gmji1KxAnsHlHzq9/vC9tszKGfDOkk7dEV6sEXoZL5Eq
 Wxs1TgcHvh9YuY+xwUVCTgcve/IuVXHqNc2VzZ2/Q5xpkaledFhaP6qinO+MezJgox4a
 utyV86tuYgbOADjlgexVSOmenGF0rsAlhOsEgexKKhrQkN+FORM+Y2Y4sVh9Udx+G2Jf
 xsC12N2/35w7WQ5BZGn6GCMVZBA8xmK4gFVTE4h8iEL2oxLutcK2qhbFdRg8uRohQnEc
 +o6A==
X-Gm-Message-State: AOJu0Yy173kf8ak90mGsqCbXFkTAjSUET8wWMKjZvtmsanmQqbZ+4q4K
 6nqUYonRWRSJnoAF21Agv/iUJ9jH92FE7zkgbcIQKegYJO3HtGuQSl/oGs8HE5TMgominXSdQ8a
 F
X-Gm-Gg: ASbGncvBNUoZxC/XTP0BO5Q+FE2d3s5jsSOq32HYCQ8E1F+9Ov+LA+ip3YHjoA95u0k
 r6tjy6dMJPgBZJVmL14xqZ+RZVNYB99dwPMEqX7wPkIC2orN+c/sdsdYZTqmZLOXsHhNlarrsHc
 e+eDnjFqyA/uzPZaex2JvdyfB7Xwcponnvf/gvUEgKQmyM5NWvU8ilMdl01gkEUKAxlvh2Fjk2+
 1ZYa4pXKbejrx/TAl3ZjGT3ij2kN8WFefezcCy28yRcIc8gnoMVdDPBdizpIKLPYiJqXbalrmxu
 kUkt9d2o1r3FSgBnKhAJ7qpdcy9B9nvSHw==
X-Google-Smtp-Source: AGHT+IEGWH0OP0Ser1Eqjql7J4UhgHLas+b2wEfwV2QbyCWH9x+XRTKtxV39DfXl1AQvxafl2HHu2w==
X-Received: by 2002:a5d:6d04:0:b0:391:4743:6de4 with SMTP id
 ffacd0b85a97d-39ad1797b1emr3148168f8f.50.1743085734537; 
 Thu, 27 Mar 2025 07:28:54 -0700 (PDT)
Received: from localhost ([179.228.213.210])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22780f4c3a6sm128409375ad.92.2025.03.27.07.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 07:28:54 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:28:27 -0300
MIME-Version: 1.0
Message-Id: <20250327-conversions-modify_ldt-v2-4-2907d4d3f6c0@suse.com>
References: <20250327-conversions-modify_ldt-v2-0-2907d4d3f6c0@suse.com>
In-Reply-To: <20250327-conversions-modify_ldt-v2-0-2907d4d3f6c0@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7270; i=rbm@suse.com;
 h=from:subject:message-id; bh=UbqRlcpoJDMSbgxUSZ4npdvFezbNjx4ge92ShYQ87no=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBn5WCXe3YyJjy3X6W+qIYb5TuFHYKRuabdYIaq7
 iJyrEW3qG2JAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZ+VglwAKCRDJC4p8Y4ZY
 pgzbEACKwmmuutpvq1AxT76thH+Oho46w4SgG6gZI7m4WeSb0DPIVO6yWbRkC7YEexPBAu84GpT
 fm1j9otLn+BlTwxE8vyN6u1j6jV/X2q9s9kfTuNa4RSQZ4xLgLQkZ+Yy+4StHDJAZgnnr0kKE+V
 KbLOe48KLo9ahow3XujnjGophgFqjADdDUspfnYFj9lGWLB3RQJsnsj4GVE/U8C7Wyrip4XE4rv
 hEacJ5jZHiEfZcxriVGeXmU0HtLP9GKDDjWPB9g6ofZ/bzCo7g2ggqATP2G08bXioz9pElpy3Jn
 C1UVKwd4iDr6kXSpEMOZGJKhXiG78wyqeGehpf/3L7ky0PPG315W1XMrfLVtgCDKGMasG9M2rV5
 lwNMRSfZOizM/KW45YZArwpgAJMqzflPq9JesuBMwTpvyJzTxIR5wvDMVv7JjLMseMO38lhLTj7
 S6Kcm2Mkg3BpNBqStqpLjLA2yGcRMMfZ2moZjQhyKjdkmKDokbkcv8YECjBuoPc0Xuy7Sr1TkDA
 avtZJjOMXAcaw6Mw2RF8pW3etHs+5c8N6BGNfBMbK5s/nJPi7oBFqIgy06AMNxkdNW+4itjKE+Q
 AbavYUnWbWkUS8hBoMwHvhMGlSw3l5sIITCNaLao+o1zqq4Db3Wq+EGaVFabG3NfRidt53R99X1
 0OZitCJszPwJbIA==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 4/6] syscalls/modify_ldt01: Refactor into new API
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
From: "Ricardo B. Marliere via ltp" <ltp@lists.linux.it>
Reply-To: rbm@suse.com
Cc: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

RnJvbTogUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KCk5vdyB0aGF0IHdlJ3Jl
IHVzaW5nIHRoZSB3cmFwcGVyIG1vZGlmeV9sZHQoKSBmcm9tIHRoZSBsYXBpL2xkdC5oIHdoaWNo
CnVzZXMgdHN0X3N5c2NhbGwoKSwgaXQgZG9lcyBub3QgbWFrZSBzZW5zZSB0byBrZWVwIHRoZSBm
aXJzdCBibG9jayBvZiB0aGUKb3JpZ2luYWwgdGVzdC4KClNpZ25lZC1vZmYtYnk6IFJpY2FyZG8g
Qi4gTWFybGnDqHJlIDxyYm1Ac3VzZS5jb20+Ci0tLQogLi4uL2tlcm5lbC9zeXNjYWxscy9tb2Rp
ZnlfbGR0L21vZGlmeV9sZHQwMS5jICAgICAgfCAyNTQgKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMjEwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbW9kaWZ5X2xkdC9tb2RpZnlfbGR0MDEu
YyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbW9kaWZ5X2xkdC9tb2RpZnlfbGR0MDEuYwpp
bmRleCA2ODRlNTM3NzI0MTRhZTQ2OGI0ZjE2ODU3ODU5NmVhYmIyN2VmMThiLi5kOTNhMjgxNWY5
ODBjMTdlOTQ5MGQwMjg1YzYzZDc2YzY5ZTg4ZDAyIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL21vZGlmeV9sZHQvbW9kaWZ5X2xkdDAxLmMKKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9tb2RpZnlfbGR0L21vZGlmeV9sZHQwMS5jCkBAIC0xLDIzMCArMSw2NCBA
QAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKIC8qCi0gKgot
ICogICBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgIENvcnAu
LCAyMDAxCi0gKgotICogICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgIHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKLSAqICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKLSAqICAgdGhl
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5z
ZSwgb3IKLSAqICAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KLSAqCi0gKiAg
IFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLAotICogICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7ICB3aXRob3V0IGV2ZW4gdGhl
IGltcGxpZWQgd2FycmFudHkgb2YKLSAqICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlCi0gKiAgIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgotICoKLSAqICAgWW91IHNob3VsZCBoYXZlIHJlY2Vp
dmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKLSAqICAgYWxvbmcg
d2l0aCB0aGlzIHByb2dyYW07ICBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCi0g
KiAgIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJv
c3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyAqIENvcHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBC
dXNpbmVzcyBNYWNoaW5lcyAgQ29ycC4sIDIwMDEKKyAqCTA3LzIwMDEgUG9ydGVkIGJ5IFdheW5l
IEJveWVyCisgKiBDb3B5cmlnaHQgKGMpIDIwMjUgU1VTRSBMTEMgUmljYXJkbyBCLiBNYXJsacOo
cmUgPHJibUBzdXNlLmNvbT4KICAqLwogCi0vKgotICogTkFNRQotICoJbW9kaWZ5X2xkdDAxLmMK
LSAqCi0gKiBERVNDUklQVElPTgotICoJVGVzdGNhc2UgdG8gY2hlY2sgdGhlIGVycm9yIGNvbmRp
dGlvbnMgZm9yIG1vZGlmeV9sZHQoMikKKy8qXAorICogVmVyaWZ5IHRoYXQgbW9kaWZ5X2xkdCgp
IGNhbGwgZmFpbHMgd2l0aCBlcnJubzoKICAqCi0gKiBDQUxMUwotICoJbW9kaWZ5X2xkdCgpCi0g
KgotICogQUxHT1JJVEhNCi0gKglibG9jazE6Ci0gKgkJSW52b2tlIG1vZGlmeV9sZHQoKSB3aXRo
IGEgZnVuYyB2YWx1ZSB3aGljaCBpcyBuZWl0aGVyCi0gKgkJMCBvciAxLiBWZXJpZnkgdGhhdCBF
Tk9TWVMgaXMgc2V0LgotICoJYmxvY2syOgotICoJCUludm9rZSBtcHJvdGVjdCgpIHdpdGggcHRy
ID09IE5VTEwuIFZlcmlmeSB0aGF0IEVJTlZBTAotICoJCWlzIHNldC4KLSAqCWJsb2NrMzoKLSAq
CQlDcmVhdGUgYW4gTERUIHNlZ21lbnQuCi0gKgkJVHJ5IHRvIHJlYWQgZnJvbSBhbiBpbnZhbGlk
IHBvaW50ZXIuCi0gKgkJVmVyaWZ5IHRoYXQgRUZBVUxUIGlzIHNldC4KLSAqCi0gKiBVU0FHRQot
ICoJbW9kaWZ5X2xkdDAxCi0gKgotICogSElTVE9SWQotICoJMDcvMjAwMSBQb3J0ZWQgYnkgV2F5
bmUgQm95ZXIKLSAqCi0gKiBSRVNUUklDVElPTlMKLSAqCU5vbmUKKyAqIC0gRUlOVkFMLCB3aGVu
IHdyaXRpbmcgKGZ1bmM9MSkgdG8gYW4gaW52YWxpZCBwb2ludGVyCisgKiAtIEVGQVVMVCwgd2hl
biByZWFkaW5nIChmdW5jPTApIGZyb20gYW4gaW52YWxpZCBwb2ludGVyCiAgKi8KIAotI2luY2x1
ZGUgImNvbmZpZy5oIgotI2luY2x1ZGUgInRlc3QuaCIKLQotVENJRF9ERUZJTkUobW9kaWZ5X2xk
dDAxKTsKLWludCBUU1RfVE9UQUwgPSAxOworI2luY2x1ZGUgInRzdF90ZXN0LmgiCiAKLSNpZiBk
ZWZpbmVkKF9faTM4Nl9fKSAmJiBkZWZpbmVkKEhBVkVfTU9ESUZZX0xEVCkKLQotI2lmZGVmIEhB
VkVfQVNNX0xEVF9ICi0jaW5jbHVkZSA8YXNtL2xkdC5oPgotI2VuZGlmCi1leHRlcm4gaW50IG1v
ZGlmeV9sZHQoaW50LCB2b2lkICosIHVuc2lnbmVkIGxvbmcpOwotCi0jaW5jbHVkZSA8YXNtL3Vu
aXN0ZC5oPgotI2luY2x1ZGUgPGVycm5vLmg+Ci0KLS8qIE5ld2VyIGxkdC5oIGZpbGVzIHVzZSB1
c2VyX2Rlc2MsIGluc3RlYWQgb2YgbW9kaWZ5X2xkdF9sZHRfcyAqLwotI2lmZGVmIEhBVkVfU1RS
VUNUX1VTRVJfREVTQwotdHlwZWRlZiBzdHJ1Y3QgdXNlcl9kZXNjIG1vZGlmeV9sZHRfczsKLSNl
bGlmICBIQVZFX1NUUlVDVF9NT0RJRllfTERUX0xEVF9TCi10eXBlZGVmIHN0cnVjdCBtb2RpZnlf
bGR0X2xkdF9zIG1vZGlmeV9sZHRfczsKLSNlbHNlCi10eXBlZGVmIHN0cnVjdCBtb2RpZnlfbGR0
X2xkdF90IHsKLQl1bnNpZ25lZCBpbnQgZW50cnlfbnVtYmVyOwotCXVuc2lnbmVkIGxvbmcgaW50
IGJhc2VfYWRkcjsKLQl1bnNpZ25lZCBpbnQgbGltaXQ7Ci0JdW5zaWduZWQgaW50IHNlZ18zMmJp
dDoxOwotCXVuc2lnbmVkIGludCBjb250ZW50czoyOwotCXVuc2lnbmVkIGludCByZWFkX2V4ZWNf
b25seToxOwotCXVuc2lnbmVkIGludCBsaW1pdF9pbl9wYWdlczoxOwotCXVuc2lnbmVkIGludCBz
ZWdfbm90X3ByZXNlbnQ6MTsKLQl1bnNpZ25lZCBpbnQgdXNlYWJsZToxOwotCXVuc2lnbmVkIGlu
dCBlbXB0eToyNTsKLX0gbW9kaWZ5X2xkdF9zOwotI2VuZGlmCi0KLWludCBjcmVhdGVfc2VnbWVu
dCh2b2lkICosIHNpemVfdCk7Ci12b2lkIGNsZWFudXAodm9pZCk7Ci12b2lkIHNldHVwKHZvaWQp
OwotCi1pbnQgbWFpbihpbnQgYWMsIGNoYXIgKiphdikKLXsKLQlpbnQgbGM7CisjaWZkZWYgX19p
Mzg2X18KKyNpbmNsdWRlICJsYXBpL2xkdC5oIgorI2luY2x1ZGUgImNvbW1vbi5oIgogCitzdGF0
aWMgdm9pZCAqcHRyOworc3RhdGljIGNoYXIgKmJ1ZjsKK3N0YXRpYyBzdHJ1Y3QgdHN0X2Nhc2Ug
eworCWludCB0ZnVuYzsKIAl2b2lkICpwdHI7Ci0JaW50IHJldHZhbCwgZnVuYzsKLQotCWludCBz
ZWdbNF07Ci0KLQl0c3RfcGFyc2Vfb3B0cyhhYywgYXYsIE5VTEwsIE5VTEwpOwotCi0Jc2V0dXAo
KTsKLQotCWZvciAobGMgPSAwOyBURVNUX0xPT1BJTkcobGMpOyBsYysrKSB7Ci0KLQkJLyogcmVz
ZXQgdHN0X2NvdW50IGluIGNhc2Ugd2UgYXJlIGxvb3BpbmcgKi8KLQkJdHN0X2NvdW50ID0gMDsK
LQotCQkvKgotCQkgKiBDaGVjayBmb3IgRU5PU1lTLgotCQkgKi8KLQkJcHRyID0gbWFsbG9jKDEw
KTsKLQkJZnVuYyA9IDEwMDsKLQkJcmV0dmFsID0gbW9kaWZ5X2xkdChmdW5jLCBwdHIsIHNpemVv
ZihwdHIpKTsKLQkJaWYgKHJldHZhbCA8IDApIHsKLQkJCWlmIChlcnJubyAhPSBFTk9TWVMpIHsK
LQkJCQl0c3RfcmVzbShURkFJTCwgIm1vZGlmeV9sZHQoKSBzZXQgaW52YWxpZCAiCi0JCQkJCSAi
ZXJybm8sIGV4cGVjdGVkIEVOT1NZUywgZ290OiAlZCIsCi0JCQkJCSBlcnJubyk7Ci0JCQl9IGVs
c2UgewotCQkJCXRzdF9yZXNtKFRQQVNTLAotCQkJCQkibW9kaWZ5X2xkdCgpIHNldCBleHBlY3Rl
ZCBlcnJubyIpOwotCQkJfQotCQl9IGVsc2UgewotCQkJdHN0X3Jlc20oVEZBSUwsICJtb2RpZnlf
bGR0IGVycm9yOiAiCi0JCQkJICJ1bmV4cGVjdGVkIHJldHVybiB2YWx1ZSAlZCIsIHJldHZhbCk7
Ci0JCX0KLQotCQlmcmVlKHB0cik7Ci0KLQkJLyoKLQkJICogQ2hlY2sgZm9yIEVJTlZBTAotCQkg
Ki8KLQkJcHRyID0gMDsKLQotCQlyZXR2YWwgPSBtb2RpZnlfbGR0KDEsIHB0ciwgc2l6ZW9mKHB0
cikpOwotCQlpZiAocmV0dmFsIDwgMCkgewotCQkJaWYgKGVycm5vICE9IEVJTlZBTCkgewotCQkJ
CXRzdF9yZXNtKFRGQUlMLCAibW9kaWZ5X2xkdCgpIHNldCBpbnZhbGlkICIKLQkJCQkJICJlcnJu
bywgZXhwZWN0ZWQgRUlOVkFMLCBnb3Q6ICVkIiwKLQkJCQkJIGVycm5vKTsKLQkJCX0gZWxzZSB7
Ci0JCQkJdHN0X3Jlc20oVFBBU1MsCi0JCQkJCSJtb2RpZnlfbGR0KCkgc2V0IGV4cGVjdGVkIGVy
cm5vIik7Ci0JCQl9Ci0JCX0gZWxzZSB7Ci0JCQl0c3RfcmVzbShURkFJTCwgIm1vZGlmeV9sZHQg
ZXJyb3I6ICIKLQkJCQkgInVuZXhwZWN0ZWQgcmV0dXJuIHZhbHVlICVkIiwgcmV0dmFsKTsKLQkJ
fQotCi0JCS8qCi0JCSAqIENyZWF0ZSBhIG5ldyBMRFQgc2VnbWVudC4KLQkJICovCi0JCWlmIChj
cmVhdGVfc2VnbWVudChzZWcsIHNpemVvZihzZWcpKSA9PSAtMSkgewotCQkJdHN0X2Jya20oVEJS
T0ssIGNsZWFudXAsICJDcmVhdGlvbiBvZiBzZWdtZW50IGZhaWxlZCIpOwotCQl9Ci0KLQkJLyoK
LQkJICogQ2hlY2sgZm9yIEVGQVVMVAotCQkgKi8KLQkJcHRyID0gc2JyaygwKTsKLQotCQlyZXR2
YWwgPSBtb2RpZnlfbGR0KDAsIHB0ciArIDB4RkZGLCBzaXplb2YocHRyKSk7Ci0JCWlmIChyZXR2
YWwgPCAwKSB7Ci0JCQlpZiAoZXJybm8gIT0gRUZBVUxUKSB7Ci0JCQkJdHN0X3Jlc20oVEZBSUws
ICJtb2RpZnlfbGR0KCkgc2V0IGludmFsaWQgIgotCQkJCQkgImVycm5vLCBleHBlY3RlZCBFRkFV
TFQsIGdvdDogJWQiLAotCQkJCQkgZXJybm8pOwotCQkJfSBlbHNlIHsKLQkJCQl0c3RfcmVzbShU
UEFTUywKLQkJCQkJIm1vZGlmeV9sZHQoKSBzZXQgZXhwZWN0ZWQgZXJybm8iKTsKLQkJCX0KLQkJ
fSBlbHNlIHsKLQkJCXRzdF9yZXNtKFRGQUlMLCAibW9kaWZ5X2xkdCBlcnJvcjogIgotCQkJCSAi
dW5leHBlY3RlZCByZXR1cm4gdmFsdWUgJWQiLCByZXR2YWwpOwotCQl9Ci0JfQotCWNsZWFudXAo
KTsKLQl0c3RfZXhpdCgpOwotfQotCi0vKgotICogY3JlYXRlX3NlZ21lbnQoKSAtCi0gKi8KLWlu
dCBjcmVhdGVfc2VnbWVudCh2b2lkICpzZWcsIHNpemVfdCBzaXplKQorCXVuc2lnbmVkIGxvbmcg
Ynl0ZWNvdW50OworCWludCBleHBfZXJybm87Cit9IHRzdF9jYXNlc1tdID0geworCS8qIHsgMTAw
LCAmYnVmLCBzaXplb2YoYnVmKSwgRU5PU1lTIH0sICAvLyAwMSBibG9jazEgKi8KKwl7IDEsICh2
b2lkICopMCwgMCwgRUlOVkFMIH0sIC8vIDAxIGJsb2NrMgorCXsgMCwgJnB0ciwgc2l6ZW9mKHB0
ciksIEVGQVVMVCB9LCAvLyAwMSBibG9jazMKK307CisKK3ZvaWQgcnVuKHVuc2lnbmVkIGludCBp
KQogewotCW1vZGlmeV9sZHRfcyBlbnRyeTsKKwlzdHJ1Y3QgdHN0X2Nhc2UgKnRjID0gJnRzdF9j
YXNlc1tpXTsKIAotCWVudHJ5LmVudHJ5X251bWJlciA9IDA7Ci0JZW50cnkuYmFzZV9hZGRyID0g
KHVuc2lnbmVkIGxvbmcpc2VnOwotCWVudHJ5LmxpbWl0ID0gc2l6ZTsKLQllbnRyeS5zZWdfMzJi
aXQgPSAxOwotCWVudHJ5LmNvbnRlbnRzID0gMDsKLQllbnRyeS5yZWFkX2V4ZWNfb25seSA9IDA7
Ci0JZW50cnkubGltaXRfaW5fcGFnZXMgPSAwOwotCWVudHJ5LnNlZ19ub3RfcHJlc2VudCA9IDA7
Ci0KLQlyZXR1cm4gbW9kaWZ5X2xkdCgxLCAmZW50cnksIHNpemVvZihlbnRyeSkpOworCVRTVF9F
WFBfRkFJTChtb2RpZnlfbGR0KHRjLT50ZnVuYywgdGMtPnB0ciwgdGMtPmJ5dGVjb3VudCksCisJ
CSAgICAgdGMtPmV4cF9lcnJubyk7CiB9CiAKIHZvaWQgc2V0dXAodm9pZCkKIHsKKwlpbnQgc2Vn
WzRdOwogCi0JdHN0X3NpZyhGT1JLLCBERUZfSEFORExFUiwgY2xlYW51cCk7Ci0KLQlURVNUX1BB
VVNFOwotfQotCi12b2lkIGNsZWFudXAodm9pZCkKLXsKLQorCXB0ciA9IHNicmsoMCkgKyAweEZG
RjsKKwljcmVhdGVfc2VnbWVudChzZWcsIHNpemVvZihzZWcpKTsKKwl0c3RfY2FzZXNbMV0ucHRy
ID0gcHRyOwogfQogCi0jZWxpZiBIQVZFX01PRElGWV9MRFQKLWludCBtYWluKHZvaWQpCi17Ci0J
dHN0X2Jya20oVENPTkYsCi0JCSBOVUxMLAotCQkgIm1vZGlmeV9sZHQgaXMgYXZhaWxhYmxlIGJ1
dCBub3QgdGVzdGVkIG9uIHRoZSBwbGF0Zm9ybSB0aGFuIF9faTM4Nl9fIik7Ci19CitzdGF0aWMg
c3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3QgPSBydW4sCisJLnRjbnQgPSBBUlJBWV9T
SVpFKHRzdF9jYXNlcyksCisJLnNldHVwID0gc2V0dXAsCisJLmJ1ZnMgPQorCQkoc3RydWN0IHRz
dF9idWZmZXJzW10peworCQkJeyAmYnVmLCAuc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdXNlcl9kZXNj
KSB9LAorCQkJe30sCisJCX0sCit9OwogCiAjZWxzZQotaW50IG1haW4odm9pZCkKLXsKLQl0c3Rf
cmVzbShUSU5GTywgIm1vZGlmeV9sZHQwMSB0ZXN0IG9ubHkgZm9yIGl4ODYiKTsKLQl0c3RfZXhp
dCgpOwotfQotCi0jZW5kaWYgLyogZGVmaW5lZChfX2kzODZfXykgKi8KK1RTVF9URVNUX1RDT05G
KCJUZXN0IHN1cHBvcnRlZCBvbmx5IG9uIGkzODYiKTsKKyNlbmRpZiAvKiBfX2kzODZfXyAqLwoK
LS0gCjIuNDkuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
