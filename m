Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E625122595
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 02:39:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B53293EA4EC
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 02:39:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 81DC63EA604
 for <ltp@lists.linux.it>; Sun, 19 May 2019 02:38:58 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3C84C2005D8
 for <ltp@lists.linux.it>; Sun, 19 May 2019 02:38:57 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id s11so5434462pfm.12
 for <ltp@lists.linux.it>; Sat, 18 May 2019 17:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwUReY0kPCQ8KXfmzXwyqpd16Vv/iQ2Jv/ts7AAR2UM=;
 b=A/e+fglSZAuAq0RDPpqwVZwvcFz/GdOmuFjlckL1oVhGOwlK2mWAoPw6mimdcHDaGZ
 m5ZqqYpjAj170DySDbr9lKd3Y0pEJbCy9T1yeNFmmSTOJkAhQKV0vDYNA5N1qilUSzIF
 heYGfmXtCLSsiwh4cIq7YrfpFp9X8UCOD/SOT83mcWLPLO3IpBmZZNm4NeZZ3vSLSWmr
 DNqNYVgLR8O/6wkiVzKlvR7SmjTvIkqYJ5QUihE91UfYLqpJQrhtxKcMDq+pJKFThDYy
 MyxLZTZ49CJw0Ga6adzkzv9EwFiNT3869m+L7m9dKjwUjfkfI90cuyorz8QdtWjDun6O
 J+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwUReY0kPCQ8KXfmzXwyqpd16Vv/iQ2Jv/ts7AAR2UM=;
 b=h7da+RHWbG+b5EOA9qJAWP2gFQns79ubU7kgiXumW3nUz6fcaOcASrdfHuTjSCm1cE
 twBqyig9sulgMRTRNrtfS08GrcfaXW44NpS3qhPk74jKZ82X2jMqUyMs1+ahM8On/Fs2
 x0Au5xSAgNaaCrhfezh0GJ9eRN8mVYUTk001ZdqZbjyzTnz0Nfc0E7wROl48Hbab6W2D
 QseVo3/yvrLhMpxyOEyEmlq/BWT98y4VVO78hPzf7V8XAFCGC/G7jIvRzErs57HVwSS0
 gQszaGnkx8xIu+OeJUV/hOlWR+hMs6TjRlpnJhs1W3nw8oHyu0OkYoa5rePmtM38yd0X
 xhPA==
X-Gm-Message-State: APjAAAVEJ2m71DFr1WaWf4bl6nAWkMbVGtvk5C2SpXk3MoCwc0YOPnIG
 HIq97kQfQpcYZ1JDRolqPc3DubYRll0=
X-Google-Smtp-Source: APXvYqxyluJNu7uBKeoMQfq5ot1tKitguoC+iavFb/3lqOplbw6jrMiq9MTWSH74cFyMLpmpCXTtqQ==
X-Received: by 2002:a62:582:: with SMTP id 124mr71772946pff.209.1558226335523; 
 Sat, 18 May 2019 17:38:55 -0700 (PDT)
Received: from sspatil-glaptop2.unitedwifi.com ([104.153.224.166])
 by smtp.gmail.com with ESMTPSA id t5sm14592814pgn.80.2019.05.18.17.38.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 17:38:55 -0700 (PDT)
From: Sandeep Patil <sspatil@android.com>
To: ltp@lists.linux.it
Date: Sat, 18 May 2019 17:38:05 -0700
Message-Id: <20190519003808.47425-3-sspatil@android.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190519003808.47425-1-sspatil@android.com>
References: <20190519003808.47425-1-sspatil@android.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com
Subject: [LTP] [PATCH 2/5] syscalls/adjtimex02: Convert to new library
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

cmVtb3ZlIFVDTElOVVggY2hlY2tzIGFsb25nIHRoZSB3YXkgYW5kIHNpbXBsaWZ5IHRoZSB0ZXN0
LgoKU2lnbmVkLW9mZi1ieTogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBhbmRyb2lkLmNvbT4KLS0t
CiAuLi4va2VybmVsL3N5c2NhbGxzL2FkanRpbWV4L2FkanRpbWV4MDIuYyAgICAgfCAzMDcgKysr
KystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMjMwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvYWRqdGlt
ZXgvYWRqdGltZXgwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hZGp0aW1leC9hZGp0
aW1leDAyLmMKaW5kZXggNDkyMjI1ZjE5Li44ODE0YjYwZTAgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvYWRqdGltZXgvYWRqdGltZXgwMi5jCisrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvYWRqdGltZXgvYWRqdGltZXgwMi5jCkBAIC0xLDI3NCArMSwxMjEgQEAK
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKIC8qCiAgKiBDb3B5cmlnaHQg
KGMpIFdpcHJvIFRlY2hub2xvZ2llcyBMdGQsIDIwMDIuICBBbGwgUmlnaHRzIFJlc2VydmVkLgot
ICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0Ci0gKiB1bmRlciB0aGUgdGVybXMgb2YgdmVyc2lvbiAyIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwotICogcHVibGlzaGVkIGJ5IHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd291bGQgYmUgdXNlZnVsLCBidXQKLSAqIFdJVEhPVVQg
QU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1F
UkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KLSAqCi0g
KiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhbG9uZwotICogd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdGhl
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKLSAqIDUxIEZyYW5rbGluIFN0cmVldCwg
RmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuCi0gKgorICogIEFVVEhPUiA6
IFNhamkgS3VtYXIuVi5SIDxzYWppLmt1bWFyQHdpcHJvLmNvbT4KICAqLwotLyoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKLSAqCi0gKiAg
ICBURVNUIElERU5USUZJRVIJOiBhZGp0aW1leDAyCi0gKgotICogICAgRVhFQ1VURUQgQlkJOiBy
b290IC8gc3VwZXJ1c2VyCi0gKgotICogICAgVEVTVCBUSVRMRQk6IFRlc3RzIGZvciBlcnJvciBj
b25kaXRpb25zCi0gKgotICogICAgVEVTVCBDQVNFIFRPVEFMCTogNgotICoKLSAqICAgIEFVVEhP
UgkJOiBTYWppIEt1bWFyLlYuUiA8c2FqaS5rdW1hckB3aXByby5jb20+Ci0gKgotICogICAgU0lH
TkFMUwotICogCVVzZXMgU0lHVVNSMSB0byBwYXVzZSBiZWZvcmUgdGVzdCBpZiBvcHRpb24gc2V0
LgotICogCShTZWUgdGhlIHBhcnNlX29wdHMoMykgbWFuIHBhZ2UpLgotICoKLSAqICAgIERFU0NS
SVBUSU9OCi0gKglWZXJpZnkgdGhhdAotICoJMSkgYWRqdGltZXgoMikgZmFpbHMgd2l0aCBlcnJu
byBzZXQgdG8gRUZBVUxUIGlmIGJ1ZiBkb2VzCi0gKgkgICBub3QgcG9pbnQgdG8gd3JpdGFibGUg
bWVtb3J5Ci0gKgkyKSBhZGp0aW1leCgyKSBmYWlscyB3aXRoIGVycm5vIHNldCB0byBFSU5WQUwg
aWYgYW4gYXR0ZW1wdAotICoJICAgaXMgIG1hZGUgIHRvIHNldCBidWYudGljayB0byBhIHZhbHVl
IDwgOTAwMDAwL0haCi0gKgkzKSBhZGp0aW1leCgyKSBmYWlscyB3aXRoIGVycm5vIHNldCB0byBF
SU5WQUwgaWYgYW4gYXR0ZW1wdAotICoJICAgaXMgIG1hZGUgIHRvIHNldCBidWYudGljayB0byBh
IHZhbHVlID4gMTEwMDAwMC9IWgotICoJNCkgYWRqdGltZXgoMikgZmFpbHMgd2l0aCBlcnJubyBz
ZXQgdG8gRUlOVkFMIGlmIGFuIGF0dGVtcHQKLSAqCSAgIGlzICBtYWRlICB0byBzZXQgYnVmLm9m
ZnNldCB0byBhIHZhbHVlID4gNTEyMDAwTAotICoJICAgKFRoaXMgdGVzdCBjYXNlIHdpbGwgYmUg
ZXhlY3V0ZWQgb25seSBpZiB0aGUga2VybmVsIHZlcnNpb24KLSAqCSAgICBpcyAyLjYuMjUgb3Ig
YmVsb3cpCi0gKgk1KSBhZGp0aW1leCgyKSBmYWlscyB3aXRoIGVycm5vIHNldCB0byBFSU5WQUwg
aWYgYW4gYXR0ZW1wdAotICoJICAgaXMgIG1hZGUgIHRvIHNldCBidWYub2Zmc2V0IHRvIGEgdmFs
dWUgPCA1MTIwMDBMCi0gKgkgICAoVGhpcyB0ZXN0IGNhc2Ugd2lsbCBiZSBleGVjdXRlZCBvbmx5
IGlmIHRoZSBrZXJuZWwgdmVyc2lvbgotICoJICAgIGlzIDIuNi4yNSBvciBiZWxvdykKLSAqCTYp
IGFkanRpbWV4KDIpIGZhaWxzIHdpdGggZXJybm8gc2V0IHRvIEVQRVJNIGlmIGJ1Zi5tb2RlIGlz
Ci0gKgkgICBub24temVybyBhbmQgdGhlIHVzZXIgaXMgbm90IHN1cGVyLXVzZXIuCi0gKgotICog
CVNldHVwOgotICogCSAgU2V0dXAgc2lnbmFsIGhhbmRsaW5nLgotICoJICBQYXVzZSBmb3IgU0lH
VVNSMSBpZiBvcHRpb24gc3BlY2lmaWVkLgotICoJICBTYXZlIGN1cnJlbnQgcGFyYW1ldGVycyBp
biB0aW1fc2F2ZQotICoKLSAqIAlUZXN0OgotICoJIExvb3AgaWYgdGhlIHByb3BlciBvcHRpb25z
IGFyZSBnaXZlbi4KLSAqCSAgQ2FsbCB0ZXN0IGNhc2Ugc3BlY2lmaWMgc2V0dXAgaWYgbmVlZGVk
Ci0gKiAJICBjYWxsIGFkanRpbWV4IHdpdGggc2F2ZWQgdGltZXggc3RydWN0dXJlCi0gKgkgIENo
ZWNrIHJldHVybiB2YWx1ZSBpcyBiZXR3ZWVuIDAgJiA1Ci0gKgkJVGVzdCBwYXNzZWQKLSAqCSAg
T3RoZXJ3aXNlCi0gKgkJVGVzdCBmYWlsZWQKLSAqCSAgQ2FsbCB0ZXN0IGNhc2Ugc3BlY2lmaWMg
Y2xlYW51cCBpZiBuZWVkZWQKLSAqCi0gKiAJQ2xlYW51cDoKLSAqIAkgIFByaW50IGVycm5vIGxv
ZyBhbmQvb3IgdGltaW5nIHN0YXRzIGlmIG9wdGlvbnMgZ2l2ZW4KLSAqCi0gKiBVU0FHRTogIDxm
b3IgY29tbWFuZC1saW5lPgotICogYWRqdGltZXgwMiBbLWMgbl0gWy1lXSBbLWkgbl0gWy1JIHhd
IFstUCB4XSBbLXRdIFstaF0gWy1mXSBbLXBdCi0gKgkJCXdoZXJlLCAgLWMgbiA6IFJ1biBuIGNv
cGllcyBjb25jdXJyZW50bHkuCi0gKgkJCQktZSAgIDogVHVybiBvbiBlcnJubyBsb2dnaW5nLgot
ICoJCQkJLWggICA6IFNob3cgaGVscCBzY3JlZW4KLSAqCQkJCS1mICAgOiBUdXJuIG9mZiBmdW5j
dGlvbmFsIHRlc3RpbmcKLSAqCQkJCS1pIG4gOiBFeGVjdXRlIHRlc3QgbiB0aW1lcy4KLSAqCQkJ
CS1JIHggOiBFeGVjdXRlIHRlc3QgZm9yIHggc2Vjb25kcy4KLSAqCQkJCS1wICAgOiBQYXVzZSBm
b3IgU0lHVVNSMSBiZWZvcmUgc3RhcnRpbmcKLSAqCQkJCS1QIHggOiBQYXVzZSBmb3IgeCBzZWNv
bmRzIGJldHdlZW4gaXRlcmF0aW9ucy4KLSAqCQkJCS10ICAgOiBUdXJuIG9uIHN5c2NhbGwgdGlt
aW5nLgotICoKLSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqLwotCi0jaWYgZGVmaW5lZCBVQ0xJTlVYICYmICFfX1RIUk9XCi0v
KiB3b3JrYXJvdW5kIGZvciBsaWJjIGJ1ZyBjYXVzaW5nIGZhaWx1cmUgaW4gc3lzL3RpbWV4Lmgg
Ki8KLSNkZWZpbmUgX19USFJPVwotI2VuZGlmCiAKICNpbmNsdWRlIDxlcnJuby5oPgogI2luY2x1
ZGUgPHN5cy90aW1leC5oPgogI2luY2x1ZGUgPHVuaXN0ZC5oPgogI2luY2x1ZGUgPHB3ZC5oPgot
I2luY2x1ZGUgInRlc3QuaCIKLSNpbmNsdWRlICJzYWZlX21hY3Jvcy5oIgorI2luY2x1ZGUgInRz
dF90ZXN0LmgiCiAKICNkZWZpbmUgU0VUX01PREUgKCBBREpfT0ZGU0VUIHwgQURKX0ZSRVFVRU5D
WSB8IEFESl9NQVhFUlJPUiB8IEFESl9FU1RFUlJPUiB8IFwKIAlBREpfU1RBVFVTIHwgQURKX1RJ
TUVDT05TVCB8IEFESl9USUNLICkKIAotc3RhdGljIHZvaWQgc2V0dXAodm9pZCk7Ci1zdGF0aWMg
aW50IHNldHVwMih2b2lkKTsKLXN0YXRpYyBpbnQgc2V0dXAzKHZvaWQpOwotc3RhdGljIGludCBz
ZXR1cDQodm9pZCk7Ci1zdGF0aWMgaW50IHNldHVwNSh2b2lkKTsKLXN0YXRpYyBpbnQgc2V0dXA2
KHZvaWQpOwotc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKTsKLXN0YXRpYyB2b2lkIGNsZWFudXA2
KHZvaWQpOwotCi1jaGFyICpUQ0lEID0gImFkanRpbWV4MDIiOwotCiBzdGF0aWMgaW50IGh6OwkJ
CS8qIEhaIGZyb20gc3lzY29uZiAqLwogCiBzdGF0aWMgc3RydWN0IHRpbWV4IHRpbV9zYXZlOwog
c3RhdGljIHN0cnVjdCB0aW1leCBidWZmOwogCi1zdGF0aWMgY2hhciBub2JvZHlfdWlkW10gPSAi
bm9ib2R5IjsKIHN0cnVjdCBwYXNzd2QgKmx0cHVzZXI7CiAKLXN0cnVjdCB0ZXN0X2Nhc2VzX3Qg
eworc3RydWN0IHRlc3RfY2FzZSB7CiAJc3RydWN0IHRpbWV4ICpidWZmcDsKLQlpbnQgKCpzZXR1
cCkgKCk7Ci0Jdm9pZCAoKmNsZWFudXApICgpOwogCWludCBleHBfZXJybm87Ci19IHRlc3RfY2Fz
ZXNbXSA9IHsKLSNpZm5kZWYgVUNMSU5VWAotCS8qIFNraXAgc2luY2UgdUNsaW51eCBkb2VzIG5v
dCBpbXBsZW1lbnQgbWVtb3J5IHByb3RlY3Rpb24gKi8KLQl7Ci0JKHN0cnVjdCB0aW1leCAqKS0x
LCBOVUxMLCBOVUxMLCBFRkFVTFR9LAotI2VuZGlmCi0JewotCSZidWZmLCBzZXR1cDIsIE5VTEws
IEVJTlZBTH0sIHsKLQkmYnVmZiwgc2V0dXAzLCBOVUxMLCBFSU5WQUx9LCB7Ci0JJmJ1ZmYsIHNl
dHVwNCwgTlVMTCwgRUlOVkFMfSwgewotCSZidWZmLCBzZXR1cDUsIE5VTEwsIEVJTlZBTH0sIHsK
LQkmYnVmZiwgc2V0dXA2LCBjbGVhbnVwNiwgRVBFUk19Cit9IHRjYXNlc1tdID0geworCXsgKHN0
cnVjdCB0aW1leCAqKS0xLCBFRkFVTFQgfSwKKwl7ICZidWZmLCBFSU5WQUx9LAorCXsgJmJ1ZmYs
IEVJTlZBTCB9LAorCXsgJmJ1ZmYsIEVQRVJNIH0sCisJeyAmYnVmZiwgRUlOVkFMIH0sCisJeyAm
YnVmZiwgRUlOVkFMIH0sCiB9OwogCi1pbnQgVFNUX1RPVEFMID0gc2l6ZW9mKHRlc3RfY2FzZXMp
IC8gc2l6ZW9mKHRlc3RfY2FzZXNbMF0pOwotCi1pbnQgbWFpbihpbnQgYWMsIGNoYXIgKiphdikK
K3ZvaWQgdmVyaWZ5X2FkanRpbWV4KHVuc2lnbmVkIGludCBucikKIHsKLQotCWludCBsYywgaTsK
LQotCXRzdF9wYXJzZV9vcHRzKGFjLCBhdiwgTlVMTCwgTlVMTCk7Ci0KLQlzZXR1cCgpOwotCi0J
Zm9yIChsYyA9IDA7IFRFU1RfTE9PUElORyhsYyk7IGxjKyspIHsKLQotCQl0c3RfY291bnQgPSAw
OwotCi0JCWZvciAoaSA9IDA7IGkgPCBUU1RfVE9UQUw7ICsraSkgewotCQkJLyoKLQkJCSAqIHNp
bmNlIExpbnV4IDIuNi4yNiwgaWYgYnVmLm9mZnNldCB2YWx1ZSBpcyBvdXRzaWRlCi0JCQkgKiB0
aGUgYWNjZXB0YWJsZSByYW5nZSwgaXQgaXMgc2ltcGx5IG5vcm1hbGl6ZWQgaW5zdGVhZAotCQkJ
ICogb2YgbGV0dGluZyB0aGUgc3lzY2FsbCBmYWlsLiBzbyBqdXN0IHNraXAgdGhpcyB0ZXN0Ci0J
CQkgKiBjYXNlLgotCQkJICovCi0JCQlpZiAoKGkgPT0gMyB8fCBpID09IDQpICYmIHRzdF9rdmVy
Y21wKDIsIDYsIDI1KSA+IDApIHsKLQkJCQl0c3RfcmVzbShUQ09ORiwgInRoaXMga2VybmVsIG5v
cm1hbGl6ZXMgYnVmLiIKLQkJCQkJICJvZmZzZXQgdmFsdWUgaWYgaXQgaXMgb3V0c2lkZSIKLQkJ
CQkJICIgdGhlIGFjY2VwdGFibGUgcmFuZ2UuIik7Ci0JCQkJY29udGludWU7Ci0JCQl9Ci0KLQkJ
CWJ1ZmYgPSB0aW1fc2F2ZTsKLQkJCWJ1ZmYubW9kZXMgPSBTRVRfTU9ERTsKLQkJCWlmICgodGVz
dF9jYXNlc1tpXS5zZXR1cCkgJiYgKHRlc3RfY2FzZXNbaV0uc2V0dXAoKSkpIHsKLQkJCQl0c3Rf
cmVzbShUV0FSTiwgInNldHVwKCkgZmFpbGVkLCBza2lwcGluZyIKLQkJCQkJICIgdGhpcyB0ZXN0
IGNhc2UiKTsKLQkJCQljb250aW51ZTsKLQkJCX0KLQotCQkJLyogQ2FsbCBhZGp0aW1leCgyKSAq
LwotCQkJVEVTVChhZGp0aW1leCh0ZXN0X2Nhc2VzW2ldLmJ1ZmZwKSk7Ci0KLQkJCWlmICgoVEVT
VF9SRVRVUk4gPT0gLTEpICYmIChURVNUX0VSUk5PID09Ci0JCQkJCQkgICAgdGVzdF9jYXNlc1tp
XS5leHBfZXJybm8pKSB7Ci0JCQkJdHN0X3Jlc20oVFBBU1MgfCBUVEVSUk5PLAotCQkJCQkgIlRl
c3QgUGFzc2VkLCBhZGp0aW1leCgpIHJldHVybmVkIC0xIik7Ci0JCQl9IGVsc2UgewotCQkJCXRz
dF9yZXNtKFRGQUlMIHwgVFRFUlJOTywKLQkJCQkJICJUZXN0IEZhaWxlZCwgYWRqdGltZXgoKSBy
ZXR1cm5lZCAlbGQiLAotCQkJCQkgVEVTVF9SRVRVUk4pOwotCQkJfQotCQkJaWYgKHRlc3RfY2Fz
ZXNbaV0uY2xlYW51cCkgewotCQkJCXRlc3RfY2FzZXNbaV0uY2xlYW51cCgpOwotCQkJfQotCQl9
CisJc3RydWN0IHRlc3RfY2FzZSAqdGNhc2UgPSAmdGNhc2VzW25yXTsKKwkvKgorCSAqIHNpbmNl
IExpbnV4IDIuNi4yNiwgaWYgYnVmLm9mZnNldCB2YWx1ZSBpcyBvdXRzaWRlCisJICogdGhlIGFj
Y2VwdGFibGUgcmFuZ2UsIGl0IGlzIHNpbXBseSBub3JtYWxpemVkIGluc3RlYWQKKwkgKiBvZiBs
ZXR0aW5nIHRoZSBzeXNjYWxsIGZhaWwuIHNvIGp1c3Qgc2tpcCB0aGlzIHRlc3QKKwkgKiBjYXNl
LgorCSAqLworCWlmIChuciA+IDMgJiYgKHRzdF9rdmVyY21wKDIsIDYsIDI1KSA+IDApKSB7CisJ
CXRzdF9yZXMoVENPTkYsICJ0aGlzIGtlcm5lbCBub3JtYWxpemVzIGJ1Zi4iCisJCQkJIm9mZnNl
dCB2YWx1ZSBpZiBpdCBpcyBvdXRzaWRlIgorCQkJCSIgdGhlIGFjY2VwdGFibGUgcmFuZ2UuIik7
CisJCXJldHVybjsKIAl9CiAKLQkvKiBjbGVhbnVwIGFuZCBleGl0ICovCi0JY2xlYW51cCgpOwor
CWJ1ZmYgPSB0aW1fc2F2ZTsKKwlidWZmLm1vZGVzID0gU0VUX01PREU7CisJc3dpdGNoIChucikg
eworCWNhc2UgMDoKKwkJYnJlYWs7CisJY2FzZSAxOgorCQlidWZmLnRpY2sgPSA5MDAwMDAgLyBo
eiAtIDE7CisJCWJyZWFrOworCWNhc2UgMjoKKwkJYnVmZi50aWNrID0gMTEwMDAwMCAvIGh6ICsg
MTsKKwkJYnJlYWs7CisJY2FzZSAzOgorCQkvKiBTd2l0Y2ggdG8gbm9ib2R5IHVzZXIgZm9yIGNv
cnJlY3QgZXJyb3IgY29kZSBjb2xsZWN0aW9uICovCisJCWx0cHVzZXIgPSBTQUZFX0dFVFBXTkFN
KCJub2JvZHkiKTsKKwkJU0FGRV9TRVRFVUlEKGx0cHVzZXItPnB3X3VpZCk7CisJCWJyZWFrOwor
CWNhc2UgNDoKKwkJYnVmZi5vZmZzZXQgPSA1MTIwMDBMICsgMTsKKwkJYnJlYWs7CisJY2FzZSA1
OgorCQlidWZmLm9mZnNldCA9ICgtMSkgKiAoNTEyMDAwTCkgLSAxOworCQlicmVhazsKKwlkZWZh
dWx0OgorCQl0c3RfYnJrKFRGQUlMLCAiSW52YWxpZCB0ZXN0IGNhc2UgJXUgIiwgbnIpOworCX0K
IAotCXRzdF9leGl0KCk7CisJVEVTVChhZGp0aW1leCh0Y2FzZS0+YnVmZnApKTsKKwlpZiAoKFRT
VF9SRVQgPT0gLTEpICYmIChUU1RfRVJSID09IHRjYXNlLT5leHBfZXJybm8pKSB7CisJCXRzdF9y
ZXMoVFBBU1MgfCBUVEVSUk5PLAorCQkJCSJhZGp0aW1leCgpIGVycm9yICV1ICIsIHRjYXNlLT5l
eHBfZXJybm8pOworCX0gZWxzZSB7CisJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLAorCQkJCSJU
ZXN0IEZhaWxlZCwgYWRqdGltZXgoKSByZXR1cm5lZCAlbGQiLAorCQkJCVRTVF9SRVQpOworCX0K
IAorCS8qIGNsZWFuIHVwIGFmdGVyIG91cnNlbHZlcyAqLworCWlmIChuciA9PSAzKQorCQlTQUZF
X1NFVEVVSUQoMCk7CiB9CiAKLS8qIHNldHVwKCkgLSBwZXJmb3JtcyBhbGwgT05FIFRJTUUgc2V0
dXAgZm9yIHRoaXMgdGVzdCAqLwogdm9pZCBzZXR1cCh2b2lkKQogewotCXRzdF9yZXF1aXJlX3Jv
b3QoKTsKLQogCXRpbV9zYXZlLm1vZGVzID0gMDsKIAotCXRzdF9zaWcoTk9GT1JLLCBERUZfSEFO
RExFUiwgY2xlYW51cCk7Ci0KIAkvKiBzZXQgdGhlIEhaIGZyb20gc3lzY29uZiAqLwotCWh6ID0g
U0FGRV9TWVNDT05GKE5VTEwsIF9TQ19DTEtfVENLKTsKKwloeiA9IFNBRkVfU1lTQ09ORihfU0Nf
Q0xLX1RDSyk7CiAKLQlURVNUX1BBVVNFOwotCi0JLyogU2F2ZSBjdXJyZW50IHBhcmFtZXRlcnMg
aW4gdGltX3NhdmUgKi8KLQlpZiAoKGFkanRpbWV4KCZ0aW1fc2F2ZSkpID09IC0xKSB7Ci0JCXRz
dF9icmttKFRCUk9LLCBOVUxMLCAiRmFpbGVkIHRvIHNhdmUgY3VycmVudCBwYXJhbWV0ZXJzIik7
Ci0JfQorCS8qIFNhdmUgY3VycmVudCBwYXJhbWV0ZXJzICovCisJaWYgKChhZGp0aW1leCgmdGlt
X3NhdmUpKSA9PSAtMSkKKwkJdHN0X2JyayhUQlJPSyB8IFRFUlJOTywKKwkJCQkiYWRqdGltZXgo
KTogZmFpbGVkIHRvIHNhdmUgY3VycmVudCBwYXJhbXMiKTsKIH0KIAotLyoKLSAqY2xlYW51cCgp
IC0gIHBlcmZvcm1zIGFsbCBPTkUgVElNRSBjbGVhbnVwIGZvciB0aGlzIHRlc3QgYXQKLSAqCQlj
b21wbGV0aW9uIG9yIHByZW1hdHVyZSBleGl0LgotICovCiB2b2lkIGNsZWFudXAodm9pZCkKIHsK
LQogCXRpbV9zYXZlLm1vZGVzID0gU0VUX01PREU7Ci0JLyogUmVzdG9yZSBzYXZlZCBwYXJhbWV0
ZXJzICovCi0JaWYgKChhZGp0aW1leCgmdGltX3NhdmUpKSA9PSAtMSkgewotCQl0c3RfcmVzbShU
V0FSTiwgIkZhaWxlZCB0byByZXN0b3JlIHNhdmVkIHBhcmFtZXRlcnMiKTsKLQl9Ci19Ci0KLWlu
dCBzZXR1cDIodm9pZCkKLXsKLQlidWZmLnRpY2sgPSA5MDAwMDAgLyBoeiAtIDE7Ci0JcmV0dXJu
IDA7Ci19Ci0KLWludCBzZXR1cDModm9pZCkKLXsKLQlidWZmLnRpY2sgPSAxMTAwMDAwIC8gaHog
KyAxOwotCXJldHVybiAwOwotfQotCi1pbnQgc2V0dXA0KHZvaWQpCi17Ci0JYnVmZi5vZmZzZXQg
PSA1MTIwMDBMICsgMTsKLQlyZXR1cm4gMDsKLX0KLQotaW50IHNldHVwNSh2b2lkKQotewotCWJ1
ZmYub2Zmc2V0ID0gKC0xKSAqICg1MTIwMDBMKSAtIDE7Ci0JcmV0dXJuIDA7Ci19CiAKLWludCBz
ZXR1cDYodm9pZCkKLXsKLQkvKiBTd2l0Y2ggdG8gbm9ib2R5IHVzZXIgZm9yIGNvcnJlY3QgZXJy
b3IgY29kZSBjb2xsZWN0aW9uICovCi0JaWYgKChsdHB1c2VyID0gZ2V0cHduYW0obm9ib2R5X3Vp
ZCkpID09IE5VTEwpIHsKLQkJdHN0X2Jya20oVEJST0ssIE5VTEwsICJcIm5vYm9keVwiIHVzZXIg
bm90IHByZXNlbnQiKTsKLQl9Ci0JaWYgKHNldGV1aWQobHRwdXNlci0+cHdfdWlkKSA9PSAtMSkg
ewotCQl0c3RfcmVzbShUV0FSTiB8IFRFUlJOTywgInNldGV1aWQoJWQpIGZhaWxlZCIsIGx0cHVz
ZXItPnB3X3VpZCk7Ci0JCXJldHVybiAxOwotCX0KLQlyZXR1cm4gMDsKKwkvKiBSZXN0b3JlIHNh
dmVkIHBhcmFtZXRlcnMgKi8KKwlpZiAoKGFkanRpbWV4KCZ0aW1fc2F2ZSkpID09IC0xKQorCQl0
c3RfcmVzKFRXQVJOLCAiRmFpbGVkIHRvIHJlc3RvcmUgc2F2ZWQgcGFyYW1ldGVycyIpOwogfQog
Ci12b2lkIGNsZWFudXA2KHZvaWQpCi17Ci0JLyogU2V0IGVmZmVjdGl2ZSB1c2VyIGlkIGJhY2sg
dG8gcm9vdCAqLwotCVNBRkVfU0VURVVJRChjbGVhbnVwLCAwKTsKLX0KK3N0YXRpYyBzdHJ1Y3Qg
dHN0X3Rlc3QgdGVzdCA9IHsKKwkubmVlZHNfcm9vdCA9IDEsCisJLnRjbnQgPSBBUlJBWV9TSVpF
KHRjYXNlcyksCisJLnNldHVwID0gc2V0dXAsCisJLmNsZWFudXAgPSBjbGVhbnVwLAorCS50ZXN0
ID0gdmVyaWZ5X2FkanRpbWV4LAorfTsKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
