Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A44A7DD11
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Apr 2025 14:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744027452; h=date :
 mime-version : message-id : references : in-reply-to : to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=MABkNJ8q1E8ail9akoRfypvy8pwH3t1BofpnLdxq2aI=;
 b=i/wX/KoGg89Mz+kOT+ktvw3oW2M8XocVkYb6ny269t89duLI8L/CV6IVuDSRRcIHwh3Kt
 LpvNqQ4GHwYR2zvErIt+isAZPsXkHCwBEwfNihxfzkhumN8JoARlyqt/arZ8JW5IAbnjLUR
 /uhY+UGhyE77dMaNwreVfnpY2DbzAfU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3570B3CAE68
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Apr 2025 14:04:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C4FA3CAFA6
 for <ltp@lists.linux.it>; Mon,  7 Apr 2025 14:03:22 +0200 (CEST)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6AC5F10009A7
 for <ltp@lists.linux.it>; Mon,  7 Apr 2025 14:03:21 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5f0c8448f99so5347971a12.1
 for <ltp@lists.linux.it>; Mon, 07 Apr 2025 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1744027401; x=1744632201; darn=lists.linux.it;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wzPRc0aGlQ/0fE6EZN/svtBICOY9e2PRGn27W5WoFTA=;
 b=Vl8esH3rAuJ/JVjCMZGg6BuDGU3MhkuJbCEGzlyuA9WxVnq/dK/jhvmJobGgOG+FdZ
 nkCIyqvJ89hjUAqAiOZ24qrEeWxiC8ouQiAqmAhNGnCMjdqec7e9KEIUD4zReSgrfsdj
 MZt6YARuNgOFxSKBYr/s5qNF2rK4G50uNNgAvMJoOVS510tr8jAeOJRUg53s93qIwN78
 ez2AQmGkAW2MviCkFh4HA5w6MZGSEgedO9yxpzJacqBvSBbGLlDBJ2KmeW+9ZmGpibEt
 W7vgXL7wCO/aV15VyboOlg/1Qn3rF3wfCPp+6sgv5bracXrgVIbS5DNZLQ5ieOx+RJPE
 047Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744027401; x=1744632201;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzPRc0aGlQ/0fE6EZN/svtBICOY9e2PRGn27W5WoFTA=;
 b=KwDM4pXXmeEgnvx0AM2TrumqbqF4349boqFSDzMOsevdy0kcAcHcUAIxP32rgJRY2Y
 KT3bIixQK9kIPnJvRcVDQHtKNJuc1WVhxmSlmVnh2FKOHaFlcZG6FZr02U7AHvEWo7r9
 Zot58f2QK8KNSlZulczrAyrV+QhcB6F1hSEtxfiWpqgVXV0cFPDjx2iu6FBGljxs7OzQ
 B35evKSfA5qOUpXGHf13MB2afmRExHrNHeJuR3iP2/lridO/AvNu0rkXF85vBaFTswSj
 tS2QpD7ADHRjErZVgrspwp/KIJcJbrGc9hzD4C58DXuGZxXaS++xmfo/A6/rkbGWIlGV
 z/XQ==
X-Gm-Message-State: AOJu0YwcDLVd6rGn/o4+qResIRv1Q8TPH6/+f+B4oiD5FxCkjCwc3d+3
 yaOA9r+N9fuQtU9qo/++kU81L1yIvzyc+7sI8CNv+v1j7zXOQU4r5nbRafVyBx5XvoQXmM614lO
 J
X-Gm-Gg: ASbGncu5zV0l45+CKob3iQAdXZrmCLw5v1spt80Vy/BpiqxfaywlAjgTKkbHBLb0QIV
 YRaM3erwrQwgti44BTZEryfRqd6LAb9/mDU5JwdCVDFiOtvj+KhLrTBAHhwg0kk0HvawB9PdVTJ
 UeNGU+rAKxmdd6Mf/z3+7MG5IpRuzOTjf4s/BxeHhCTtsWnrX2wbGMxML9cF0vYmK1GVna7SS2J
 3I5gme2MWTjqLD9+ol7VZAs2deyE+AJmkdEEz3hwsSHEnNR9h22kYzVR9hSXkH2FfjFvRXql2OT
 Gpw95reOjwk6o7trJMC9q3bYDRN3SmHBWw==
X-Google-Smtp-Source: AGHT+IGhuXYCewe/sKb1Y4qOtMuAQpYx35iOXvY8T6xQSUApxpIS1DMUuyEktm39AfJuJau2IkdIow==
X-Received: by 2002:a17:907:1c0e:b0:ac3:bdd2:e70c with SMTP id
 a640c23a62f3a-ac7d195c0e2mr1088531566b.35.1744027400580; 
 Mon, 07 Apr 2025 05:03:20 -0700 (PDT)
Received: from localhost ([179.228.213.210])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-229787763b3sm78607555ad.236.2025.04.07.05.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 05:03:20 -0700 (PDT)
Date: Mon, 07 Apr 2025 09:03:05 -0300
MIME-Version: 1.0
Message-Id: <20250407-conversions-modify_ldt-v7-2-cbeb379360a5@suse.com>
References: <20250407-conversions-modify_ldt-v7-0-cbeb379360a5@suse.com>
In-Reply-To: <20250407-conversions-modify_ldt-v7-0-cbeb379360a5@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7685; i=rbm@suse.com;
 h=from:subject:message-id; bh=SNL6vTlwVgSNnn3pz4al7LZo4BmI7zp7uUTksoN/FEo=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBn877/lg4BT+SazRhGM2VClZuytPhl4WQFtJCxm
 FTnPK01VhOJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZ/O+/wAKCRDJC4p8Y4ZY
 ppzmD/9vYrYTRqDf/zlNKp6O6N2lVyfZYO5Gi2YI4xs2rdkUTdZS3MynpkZ8iyPZ5OAau4wbqeD
 x8mCg6vsB6SS7zeFsPPNHoVMUNzopEXGWTuZaz6QBm8F4zRDe1j//t3wehg5JIyxcRO3/rKjadU
 LgPhFbc6w5XKUA1oKAuH/isrVtqBlM3i+RspO8/M9zTxhNPUfkVi8omhzXtvsJgcpfzRsSWB9OY
 uzAg3Vek0ceCateKNtm0zSH9+muLtw64y7FXtF4qbwXlBuUer42XyI8V3BqWlXgGOylTAmsKaCv
 kMX7sG0fk2kJKBNobIMW0K39MurYMHbekJ8gS9dBcPtllAFjzxgriKygX9SD0wsKTHuO+sLMyuY
 X9q2u1ScpminLTLoIU9iOrx5RiecRGugOWFH0LHJnk3vyYHG+dk8t0tt15zbfDKwa0SUJH3Zlgc
 wnWiBL++VkzFei3u+/ghIDuAwAnRAcdD1Tqr3cY4rWgFM+gWylFwg9BuPC1Nkh35sDmX+I1yVmF
 +ytgYwqz/GzfnJhMzJJXzi+/tCfT8qnQTtV+8Zm8A/TUS9oIBARWA+UKvGWFWsGE124yGUROhpr
 OZPKIzn9jqRGkZmE9DqbIb2NmlzlQ01YJrAi4+esXAPwl04HlaTTWAf30FOInznL3iyfuktkKdr
 GBo8EhiHbOS722g==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v7 2/3] syscalls/modify_ldt02: Refactor into new API
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

RnJvbTogUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBB
bmRyZWEgQ2VydmVzYXRvIDxhbmRyZWEuY2VydmVzYXRvQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5
OiBSaWNhcmRvIEIuIE1hcmxpw6hyZSA8cmJtQHN1c2UuY29tPgotLS0KIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvbW9kaWZ5X2xkdC9jb21tb24uaCAgICAgIHwgIDMwICsrKwogLi4uL2tlcm5l
bC9zeXNjYWxscy9tb2RpZnlfbGR0L21vZGlmeV9sZHQwMi5jICAgICAgfCAyMjEgKysrKystLS0t
LS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKyksIDE3NSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21vZGlmeV9s
ZHQvY29tbW9uLmggYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21vZGlmeV9sZHQvY29tbW9u
LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMC4uNDBlMzMyNTE1MjhkYzMzNTJjMzljMjIxZjI2YmI5MTczMzQyNDE2Mgot
LS0gL2Rldi9udWxsCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbW9kaWZ5X2xkdC9j
b21tb24uaApAQCAtMCwwICsxLDMwIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcgorLyoKKyAqIENvcHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBCdXNpbmVz
cyBNYWNoaW5lcyAgQ29ycC4sIDIwMDEKKyAqCTA3LzIwMDEgUG9ydGVkIGJ5IFdheW5lIEJveWVy
CisgKiBDb3B5cmlnaHQgKGMpIDIwMjUgU1VTRSBMTEMgUmljYXJkbyBCLiBNYXJsacOocmUgPHJi
bUBzdXNlLmNvbT4KKyAqLworCisjaWZuZGVmIENPTU1PTl9ICisjZGVmaW5lIENPTU1PTl9ICisK
KyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorI2luY2x1ZGUgImxhcGkvbGR0LmgiCisKK2ludCBjcmVh
dGVfc2VnbWVudCh2b2lkICpzZWcsIHNpemVfdCBzaXplKQoreworCXN0cnVjdCB1c2VyX2Rlc2Mg
ZW50cnkgPSB7CisJCS5lbnRyeV9udW1iZXIgPSAwLAorCQkuYmFzZV9hZGRyID0gKHVuc2lnbmVk
IGxvbmcpc2VnLAorCQkubGltaXQgPSBzaXplLAorCQkuc2VnXzMyYml0ID0gMSwKKwkJLmNvbnRl
bnRzID0gMCwKKwkJLnJlYWRfZXhlY19vbmx5ID0gMCwKKwkJLmxpbWl0X2luX3BhZ2VzID0gMCwK
KwkJLnNlZ19ub3RfcHJlc2VudCA9IDAsCisJfTsKKworCXJldHVybiBTQUZFX01PRElGWV9MRFQo
MSwgJmVudHJ5LCBzaXplb2YoZW50cnkpKTsKK30KKworI2VuZGlmCmRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL21vZGlmeV9sZHQvbW9kaWZ5X2xkdDAyLmMgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL21vZGlmeV9sZHQvbW9kaWZ5X2xkdDAyLmMKaW5kZXggNTExM2Iz
ZmI0ZTI5ZDI0MWU4MTllOThjOTBjMjk3MTA3YWVjOTNjZi4uZTMwMTYyMjA1MmE0ZDIwMDQ3YzYy
MmEwZDY1YTkxODhhNDI3YWQ4NiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9tb2RpZnlfbGR0L21vZGlmeV9sZHQwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvbW9kaWZ5X2xkdC9tb2RpZnlfbGR0MDIuYwpAQCAtMSwxOTkgKzEsNzAgQEAKKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCiAvKgotICoKLSAqICAgQ29weXJp
Z2h0IChjKSBJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzICBDb3JwLiwgMjAwMQotICoK
LSAqICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7ICB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0gKiAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Ci0gKiAgIHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCi0gKiAg
IChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCi0gKgotICogICBUaGlzIHByb2dy
YW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKLSAq
ICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyAgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCi0gKiAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRS4gIFNlZQotICogICB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4KLSAqCi0gKiAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCi0gKiAgIGFsb25nIHdpdGggdGhpcyBw
cm9ncmFtOyAgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQotICogICBGb3VuZGF0
aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAy
MTEwLTEzMDEgVVNBCi0gKi8KLQotLyoKLSAqIE5BTUUKLSAqCW1vZGlmeV9sZHQwMi5jCi0gKgot
ICogREVTQ1JJUFRJT04KLSAqCVRlc3RjYXNlIHRvIGNoZWNrIHRoZSBlcnJvciBjb25kaXRpb25z
IGZvciBtb2RpZnlfbGR0KDIpCi0gKgotICogQUxHT1JJVEhNCi0gKglibG9jazE6Ci0gKgkJQ3Jl
YXRlIGEgc2VnbWVudCBhdCBlbnRyeSAwIGFuZCBhIHZhbGlkIGJhc2UgYWRkcmVzcy4KLSAqCQlS
ZWFkIHRoZSBjb250ZW50cyBvZiB0aGUgc2VnbWVudCB0aHJ1JyBmcyByZWdpc3Rlci4KLSAqCQlW
YWxpZGF0ZSB0aGUgZGF0YS4KLSAqCQlXcml0ZSBhbiBpbnZhbGlkIGJhc2UgYWRkcmVzcyBpbnRv
IGVudHJ5IDAuCi0gKgkJUmVhZCB0aGUgY29udGVudHMgb2YgZW50cnkgMCBpbiB0aGUgY2hpbGQg
cHJvY2Vzcy4KLSAqCQlWZXJpZnkgdGhhdCBhIFNJR1NFR1YgaXMgaW5jdXJyZWQuCi0gKgotICog
VVNBR0UKLSAqCW1vZGlmeV9sZHQwMgotICoKLSAqIEhJU1RPUlkKKyAqIENvcHlyaWdodCAoYykg
SW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyAgQ29ycC4sIDIwMDEKICAqCTA3LzIwMDEg
UG9ydGVkIGJ5IFdheW5lIEJveWVyCi0gKgotICogUkVTVFJJQ1RJT05TCi0gKglOb25lCisgKiBD
b3B5cmlnaHQgKGMpIDIwMjUgU1VTRSBMTEMgUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNl
LmNvbT4KICAqLwogCi0jaW5jbHVkZSAiY29uZmlnLmgiCi0jaW5jbHVkZSAidGVzdC5oIgotCi1U
Q0lEX0RFRklORShtb2RpZnlfbGR0MDIpOwotaW50IFRTVF9UT1RBTCA9IDE7Ci0KLSNpZiBkZWZp
bmVkKF9faTM4Nl9fKSAmJiBkZWZpbmVkKEhBVkVfTU9ESUZZX0xEVCkKLQotI2lmZGVmIEhBVkVf
QVNNX0xEVF9ICi0jaW5jbHVkZSA8YXNtL2xkdC5oPgotI2VuZGlmCi1leHRlcm4gaW50IG1vZGlm
eV9sZHQoaW50LCB2b2lkICosIHVuc2lnbmVkIGxvbmcpOwotCi0jaW5jbHVkZSA8YXNtL3VuaXN0
ZC5oPgotI2luY2x1ZGUgPHN0cmluZy5oPgotI2luY2x1ZGUgPHN5cy93YWl0Lmg+Ci0jaW5jbHVk
ZSA8ZXJybm8uaD4KLQotLyogTmV3ZXIgbGR0LmggZmlsZXMgdXNlIHVzZXJfZGVzYywgaW5zdGVh
ZCBvZiBtb2RpZnlfbGR0X2xkdF9zICovCi0jaWZkZWYgSEFWRV9TVFJVQ1RfVVNFUl9ERVNDCi10
eXBlZGVmIHN0cnVjdCB1c2VyX2Rlc2MgbW9kaWZ5X2xkdF9zOwotI2VsaWYgIEhBVkVfU1RSVUNU
X01PRElGWV9MRFRfTERUX1MKLXR5cGVkZWYgc3RydWN0IG1vZGlmeV9sZHRfbGR0X3MgbW9kaWZ5
X2xkdF9zOwotI2Vsc2UKLXR5cGVkZWYgc3RydWN0IG1vZGlmeV9sZHRfbGR0X3QgewotCXVuc2ln
bmVkIGludCBlbnRyeV9udW1iZXI7Ci0JdW5zaWduZWQgbG9uZyBpbnQgYmFzZV9hZGRyOwotCXVu
c2lnbmVkIGludCBsaW1pdDsKLQl1bnNpZ25lZCBpbnQgc2VnXzMyYml0OjE7Ci0JdW5zaWduZWQg
aW50IGNvbnRlbnRzOjI7Ci0JdW5zaWduZWQgaW50IHJlYWRfZXhlY19vbmx5OjE7Ci0JdW5zaWdu
ZWQgaW50IGxpbWl0X2luX3BhZ2VzOjE7Ci0JdW5zaWduZWQgaW50IHNlZ19ub3RfcHJlc2VudDox
OwotCXVuc2lnbmVkIGludCB1c2VhYmxlOjE7Ci0JdW5zaWduZWQgaW50IGVtcHR5OjI1OwotfSBt
b2RpZnlfbGR0X3M7Ci0jZW5kaWYKLQotaW50IGNyZWF0ZV9zZWdtZW50KHZvaWQgKiwgc2l6ZV90
KTsKLWludCByZWFkX3NlZ21lbnQodW5zaWduZWQgaW50KTsKLXZvaWQgY2xlYW51cCh2b2lkKTsK
LXZvaWQgc2V0dXAodm9pZCk7Ci0KLWludCBtYWluKGludCBhYywgY2hhciAqKmF2KQotewotCWlu
dCBsYzsKLQotCWludCB2YWwsIHBpZCwgc3RhdHVzOwotCi0JaW50IHNlZ1s0XTsKLQotCXRzdF9w
YXJzZV9vcHRzKGFjLCBhdiwgTlVMTCwgTlVMTCk7Ci0KLQlzZXR1cCgpOwotCi0JZm9yIChsYyA9
IDA7IFRFU1RfTE9PUElORyhsYyk7IGxjKyspIHsKLQkJdHN0X2NvdW50ID0gMDsKLQotCQlzZWdb
MF0gPSAxMjM0NTsKLQkJaWYgKGNyZWF0ZV9zZWdtZW50KHNlZywgc2l6ZW9mKHNlZykpID09IC0x
KSB7Ci0JCQl0c3RfYnJrbShUQlJPSywgY2xlYW51cCwgIkNyZWF0aW9uIG9mIHNlZ21lbnQgZmFp
bGVkIik7Ci0JCX0KLQotCQl2YWwgPSByZWFkX3NlZ21lbnQoMCk7Ci0KLQkJaWYgKHZhbCAhPSBz
ZWdbMF0pIHsKLQkJCXRzdF9yZXNtKFRGQUlMLCAiSW52YWxpZCB2YWx1ZSByZWFkICVkLCBleHBl
Y3RlZCAlZCIsCi0JCQkJIHZhbCwgc2VnWzBdKTsKLQkJfSBlbHNlCi0JCQl0c3RfcmVzbShUUEFT
UywgInZhbHVlIHJlYWQgYXMgZXhwZWN0ZWQiKTsKLQotCQlpZiAoY3JlYXRlX3NlZ21lbnQoMCwg
MTApID09IC0xKSB7Ci0JCQl0c3RfYnJrbShUQlJPSywgY2xlYW51cCwgIkNyZWF0aW9uIG9mIHNl
Z21lbnQgZmFpbGVkIik7Ci0JCX0KLQotCQl0c3Rfb2xkX2ZsdXNoKCk7Ci0JCWlmICgocGlkID0g
dHN0X2ZvcmsoKSkgPT0gMCkgewotCQkJc2lnbmFsKFNJR1NFR1YsIFNJR19ERkwpOwotCQkJdmFs
ID0gcmVhZF9zZWdtZW50KDApOwotCQkJZXhpdCgxKTsKLQkJfQotCi0JCSh2b2lkKXdhaXRwaWQo
cGlkLCAmc3RhdHVzLCAwKTsKLQotCQlpZiAoV0VYSVRTVEFUVVMoc3RhdHVzKSAhPSAwKSB7Ci0J
CQl0c3RfcmVzbShURkFJTCwgIkRpZCBub3QgZ2VuZXJhdGUgU0VHViwgY2hpbGQgcmV0dXJuZWQg
IgotCQkJCSAidW5leHBlY3RlZCBzdGF0dXMiKTsKLQkJfSBlbHNlIHsKLQkJCWlmIChXSUZTSUdO
QUxFRChzdGF0dXMpICYmIChXVEVSTVNJRyhzdGF0dXMpID09IFNJR1NFR1YpKQotCQkJCXRzdF9y
ZXNtKFRQQVNTLCAiZ2VuZXJhdGUgU0VHViBhcyBleHBlY3RlZCIpOwotCQkJZWxzZQotCQkJCXRz
dF9yZXNtKFRGQUlMLCAiRGlkIG5vdCBnZW5lcmF0ZSBTRUdWIik7Ci0JCX0KLQl9Ci0JY2xlYW51
cCgpOwotCXRzdF9leGl0KCk7Ci0KLX0KLQotaW50IGNyZWF0ZV9zZWdtZW50KHZvaWQgKnNlZywg
c2l6ZV90IHNpemUpCi17Ci0JbW9kaWZ5X2xkdF9zIGVudHJ5OworLypcCisgKiBWZXJpZnkgdGhh
dCBhZnRlciB3cml0aW5nIGFuIGludmFsaWQgYmFzZSBhZGRyZXNzIGludG8gYSBzZWdtZW50IGVu
dHJ5LAorICogYSBzdWJzZXF1ZW50IHNlZ21lbnQgZW50cnkgcmVhZCB3aWxsIHJhaXNlIFNJR1NF
Vi4KKyAqLwogCi0JZW50cnkuZW50cnlfbnVtYmVyID0gMDsKLQllbnRyeS5iYXNlX2FkZHIgPSAo
dW5zaWduZWQgbG9uZylzZWc7Ci0JZW50cnkubGltaXQgPSBzaXplOwotCWVudHJ5LnNlZ18zMmJp
dCA9IDE7Ci0JZW50cnkuY29udGVudHMgPSAwOwotCWVudHJ5LnJlYWRfZXhlY19vbmx5ID0gMDsK
LQllbnRyeS5saW1pdF9pbl9wYWdlcyA9IDA7Ci0JZW50cnkuc2VnX25vdF9wcmVzZW50ID0gMDsK
KyNpbmNsdWRlICJ0c3RfdGVzdC5oIgogCi0JcmV0dXJuIG1vZGlmeV9sZHQoMSwgJmVudHJ5LCBz
aXplb2YoZW50cnkpKTsKLX0KKyNpZmRlZiBfX2kzODZfXworI2luY2x1ZGUgImNvbW1vbi5oIgog
CiBpbnQgcmVhZF9zZWdtZW50KHVuc2lnbmVkIGludCBpbmRleCkKIHsKIAlpbnQgcmVzOworCiAJ
X19hc21fXyBfX3ZvbGF0aWxlX18oIlxuXAogCQkJcHVzaCAgICAkMHgwMDA3O1xuXAogCQkJcG9w
ICAgICAlJWZzO1xuXAotCQkJbW92bCAgICAlJWZzOiglMSksICUwIjoiPXIiKHJlcykKLQkJCSAg
ICAgOiJyIihpbmRleCAqIHNpemVvZihpbnQpKSk7CisJCQltb3ZsICAgICUlZnM6KCUxKSwgJTAi
CisJCQkgICAgIDogIj1yIihyZXMpCisJCQkgICAgIDogInIiKGluZGV4ICogc2l6ZW9mKGludCkp
KTsKKwogCXJldHVybiByZXM7CiB9CiAKLXZvaWQgc2V0dXAodm9pZCkKK3ZvaWQgcnVuKHZvaWQp
CiB7Ci0JdHN0X3NpZyhGT1JLLCBERUZfSEFORExFUiwgY2xlYW51cCk7CisJaW50IHBpZCwgc3Rh
dHVzLCBzZWdbNF07CiAKLQlURVNUX1BBVVNFOwotfQorCXNlZ1swXSA9IDEyMzQ1OwogCi12b2lk
IGNsZWFudXAodm9pZCkKLXsKKwljcmVhdGVfc2VnbWVudChzZWcsIHNpemVvZihzZWcpKTsKIAot
fQotI2VsaWYgSEFWRV9NT0RJRllfTERUCi1pbnQgbWFpbih2b2lkKQotewotCXRzdF9icmttKFRD
T05GLAotCQkgTlVMTCwKLQkJICJtb2RpZnlfbGR0IGlzIGF2YWlsYWJsZSBidXQgbm90IHRlc3Rl
ZCBvbiB0aGUgcGxhdGZvcm0gdGhhbiBfX2kzODZfXyIpOwotfQorCVRTVF9FWFBfRVFfTEkocmVh
ZF9zZWdtZW50KDApLCBzZWdbMF0pOwogCi0jZWxzZSAvKiBpZiBkZWZpbmVkKF9faTM4Nl9fKSAq
LworCWNyZWF0ZV9zZWdtZW50KDAsIDEwKTsKIAotaW50IG1haW4odm9pZCkKLXsKLQl0c3RfcmVz
bShUSU5GTywgIm1vZGlmeV9sZHQwMiB0ZXN0IG9ubHkgZm9yIGl4ODYiKTsKLQl0c3RfZXhpdCgp
OworCXBpZCA9IFNBRkVfRk9SSygpOworCWlmICghcGlkKSB7CisJCXNpZ25hbChTSUdTRUdWLCBT
SUdfREZMKTsKKwkJcmVhZF9zZWdtZW50KDApOworCQlleGl0KDEpOworCX0KKworCVNBRkVfV0FJ
VFBJRChwaWQsICZzdGF0dXMsIDApOworCWlmIChXRVhJVFNUQVRVUyhzdGF0dXMpICE9IDApIHsK
KwkJdHN0X3JlcyhURkFJTCwgIkRpZCBub3QgZ2VuZXJhdGUgU0VHViwgY2hpbGQgcmV0dXJuZWQg
IgorCQkJICAgICAgICJ1bmV4cGVjdGVkIHN0YXR1cyIpOworCX0gZWxzZSB7CisJCWlmIChXSUZT
SUdOQUxFRChzdGF0dXMpICYmIChXVEVSTVNJRyhzdGF0dXMpID09IFNJR1NFR1YpKQorCQkJdHN0
X3JlcyhUUEFTUywgImdlbmVyYXRlIFNFR1YgYXMgZXhwZWN0ZWQiKTsKKwkJZWxzZQorCQkJdHN0
X3JlcyhURkFJTCwgIkRpZCBub3QgZ2VuZXJhdGUgU0VHViIpOworCX0KIH0KIAotI2VuZGlmIC8q
IGlmIGRlZmluZWQoX19pMzg2X18pICovCitzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7
CisJLnRlc3RfYWxsID0gcnVuLAorCS5mb3Jrc19jaGlsZCA9IDEsCit9OworCisjZWxzZQorVFNU
X1RFU1RfVENPTkYoIlRlc3Qgc3VwcG9ydGVkIG9ubHkgb24gaTM4NiIpOworI2VuZGlmIC8qIF9f
aTM4Nl9fICovCgotLSAKMi40OS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
