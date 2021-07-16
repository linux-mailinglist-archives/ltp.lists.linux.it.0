Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B22623CB718
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 14:03:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1ED493C8621
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 14:03:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 94A253C65C0
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 14:03:08 +0200 (CEST)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EB03D601208
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 14:03:07 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id h4so12492898ljo.6
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z0Em+KHHL4PWCnEJLKKkilIjiYldGCGRNLDOtsHRfPY=;
 b=UrQJ/RJFGSxpy9PUjVSgzIN3arIIYfO6i+NTBUJ3lFde5eNFuBW6nuZ2LtSBryY8eR
 N1xjWRG5XvGnLrCTYS5SD+uanpOIHpLItCUXfN3c+bSWz3Esr+gNHlTdszBMqVMmFXby
 XHoK/CyToIWoFNFZweIrN6PNVZkNhnhDpEfxEkRMce0K+ptV7OxWOVq0YSbTkcFKuTkI
 oFIF08uF+ySgMY7ymA9eCudgxHOEQFLwNjzs6i8860KHO8jLfnuvorNwhunayYZPNzc1
 FpBLNa7Bd+RQAQCg1rC8DHt2dmP0dVFWG2UtbRwQ20B4iY8emVE/23xi2vhJE/g/PIYg
 mNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z0Em+KHHL4PWCnEJLKKkilIjiYldGCGRNLDOtsHRfPY=;
 b=Hy1lTUS1sJi4szB7gJ3OH83+ZjsVlthDxE8qJQosiH+2AGd9Dhy09VoJQ/ZHeBwMcu
 PsDKrpFgvuTooVgSPsl+shhJCchzJGD5jNGUBTVtbeIJnOJ71SnwpC3rdwvOcycc1Wr6
 51tq2GjsthWDDDrxOfdPRPZ5NaBw7tN9C6rXwQgkCWfJRm6gUOhNs72FpM2YsIn0yfy+
 mqX6PgYZJaZhdFuixXF7FGNi1veJQrDfKBdQRZ6F+G1oo2jljxw9jfmLh1JaAqLzS8kp
 CSzSvoNtHG1x//Vqbua6V/hkBOIfY7KTH1a4+UV/ID0A1mzwIvCSUEc0DFIjJSovTrQP
 WCtg==
X-Gm-Message-State: AOAM53207ipClkFWxJ575LhejibGYmpLISFBYtLxFZtLAaxwUEzFeEfx
 WirHQHBoYjKSSimbsXXNR6yusyWhAc6K
X-Google-Smtp-Source: ABdhPJyMOXS2QeVLvDh2uGXgtAM/H2NbxS0Csu8yaJE7fT96k7Ez1Qnq9BLzfX4lvWrGhg+e1jkv6Q==
X-Received: by 2002:a2e:8909:: with SMTP id d9mr8699697lji.65.1626436986950;
 Fri, 16 Jul 2021 05:03:06 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id y22sm627861lfg.127.2021.07.16.05.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 05:03:06 -0700 (PDT)
To: Li Wang <liwang@redhat.com>
References: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <6e1a3663-59ea-5286-5c36-558b077184aa@bell-sw.com>
Date: Fri, 16 Jul 2021 15:03:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto/af_alg02: use pthread_tryjoin_np() instead
 of pthread_kill()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCk9uIDE2LjA3LjIwMjEgMTA6MDYsIExpIFdhbmcgd3JvdGU6Cj4gSGkgQWxleGV5LAo+
IAo+IE9uIFRodSwgSnVsIDE1LCAyMDIxIGF0IDY6MjkgUE0gQWxleGV5IEtvZGFuZXYgPGFsZWtz
ZWkua29kYW5ldkBiZWxsLXN3LmNvbSA8bWFpbHRvOmFsZWtzZWkua29kYW5ldkBiZWxsLXN3LmNv
bT4+IHdyb3RlOgo+IAo+ICAgICBtdXNsIGRvZXNuJ3QgcmV0dXJuIEVTUkNIIGZvciBwdGhyZWFk
X2tpbGwoKSBpZiB0aHJlYWQgaWQgaXMgbm90IGZvdW5kLgo+IAo+ICAgICBQT1NJWCBvbmx5IHJl
Y29tbWVuZHMgdG8gcmV0dXJuIEVTUkNILCBhbmQgYWxzbyBzYXlzIHRoYXQgcHRocmVhZF9raWxs
KCkKPiAgICAgcHJvZHVjZXMgdW5kZWZpbmVkIGJlaGF2aW9yIGlmIHRpZCBsaWZldGltZSBoYXMg
ZW5kZWQgWzFdLgo+IAo+ICAgICBbMV06IGh0dHBzOi8vbWFuNy5vcmcvbGludXgvbWFuLXBhZ2Vz
L21hbjMvcHRocmVhZF9raWxsLjMuaHRtbCA8aHR0cHM6Ly9tYW43Lm9yZy9saW51eC9tYW4tcGFn
ZXMvbWFuMy9wdGhyZWFkX2tpbGwuMy5odG1sPgo+IAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4
ZXkgS29kYW5ldiA8YWxla3NlaS5rb2RhbmV2QGJlbGwtc3cuY29tIDxtYWlsdG86YWxla3NlaS5r
b2RhbmV2QGJlbGwtc3cuY29tPj4KPiAgICAgLS0tCj4gICAgIMKgdGVzdGNhc2VzL2tlcm5lbC9j
cnlwdG8vYWZfYWxnMDIuYyB8IDIgKy0KPiAgICAgwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiAgICAgZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvY3J5cHRvL2FmX2FsZzAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5j
Cj4gICAgIGluZGV4IDMxZDMwNzc3Yy4uMGY1NzkzYzE2IDEwMDY0NAo+ICAgICAtLS0gYS90ZXN0
Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jCj4gICAgICsrKyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvY3J5cHRvL2FmX2FsZzAyLmMKPiAgICAgQEAgLTYwLDcgKzYwLDcgQEAgc3RhdGljIHZvaWQg
cnVuKHZvaWQpCj4gCj4gICAgIMKgIMKgIMKgIMKgIFRTVF9DSEVDS1BPSU5UX1dBSVQoMCk7Cj4g
Cj4gICAgIC3CoCDCoCDCoCDCoHdoaWxlIChwdGhyZWFkX2tpbGwodGhyLCAwKSAhPSBFU1JDSCkg
ewo+ICAgICArwqAgwqAgwqAgwqB3aGlsZSAocHRocmVhZF90cnlqb2luX25wKHRociwgTlVMTCkg
PT0gRUJVU1kpIHsKPiAKPiAKPiBJJ20gbm90IHN1cmUgaWZzYWZlZW5vdWdoIHRvIHVzZSBiZWNh
dXNlIGl0IGlzIG5vbnN0YW5kYXJkIEdOVSBleHRlbnNpb25zCj4gYW5kIHRoZSAiX25wIiBtZWFu
cyBub25wb3J0YWJsZS4KPiAKPiBNYXliZSBhbm90aGVyIHdvcmthcm91bmQgaXMgdG8gZGVmaW5l
IGEgdm9sYXRpbGXCoGZsYWcgJ3RocmVhZF9jb21wbGV0ZScswqAKPiBpbml0aWFsaXplIGl0IHRv
ICcwJyB3aGVuIHRocmVhZF9CIHN0YXJ0cyBhbmQgcmVzZXQgdG8gJzEnIHdoaWxlIGV4aXQsIGFu
ZCBqdXN0Cj4gZG8gYSB2YWx1ZSBjaGVjayBpbiB0aGUgd2hpbGUgbG9vcCBvZiB0aHJlYWRfQSBz
aG91bGQgYWNxdWlyZcKgdGhyZWFkX0Igc3RhdHVzLgo+IElzIHRoaXMgd2F5IGEgYml0IGJldHRl
cj8gCgpPSywgd2h5IG5vdCwgc28gc29tZXRoaW5nIGxpa2UgdGhpczoKCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9jcnlw
dG8vYWZfYWxnMDIuYwppbmRleCAwZjU3OTNjMTYuLjFmZTBmM2JmMCAxMDA2NDQKLS0tIGEvdGVz
dGNhc2VzL2tlcm5lbC9jcnlwdG8vYWZfYWxnMDIuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL2Ny
eXB0by9hZl9hbGcwMi5jCkBAIC0xOCwxMSArMTgsMTMgQEAKICNpbmNsdWRlICJ0c3RfdGVzdC5o
IgogI2luY2x1ZGUgInRzdF9hZl9hbGcuaCIKICNpbmNsdWRlICJ0c3Rfc2FmZV9wdGhyZWFkLmgi
CisjaW5jbHVkZSAidHN0X2F0b21pYy5oIgogI2luY2x1ZGUgPHB0aHJlYWQuaD4KICNpbmNsdWRl
IDxlcnJuby5oPgoKICNkZWZpbmUgU0FMU0EyMF9JVl9TSVpFICAgICAgIDgKICNkZWZpbmUgU0FM
U0EyMF9NSU5fS0VZX1NJWkUgIDE2CitzdGF0aWMgaW50IGNvbXBsZXRlZDsKCiBzdGF0aWMgdm9p
ZCAqdmVyaWZ5X2VuY3J5cHQodm9pZCAqYXJnKQogewpAQCAtNDgsNiArNTAsOCBAQCBzdGF0aWMg
dm9pZCAqdmVyaWZ5X2VuY3J5cHQodm9pZCAqYXJnKQogICAgICAgICAgICAgICAgdHN0X3JlcyhU
UEFTUywgIlN1Y2Nlc3NmdWxseSBcImVuY3J5cHRlZFwiIGFuIGVtcHR5IG1lc3NhZ2UiKTsKICAg
ICAgICBlbHNlCiAgICAgICAgICAgICAgICB0c3RfcmVzKFRGQUlMLCAicmVhZCgpIGRpZG4ndCBy
ZXR1cm4gMCIpOworCisgICAgICAgdHN0X2F0b21pY19zdG9yZSgxLCAmY29tcGxldGVkKTsKICAg
ICAgICByZXR1cm4gYXJnOwogfQoKQEAgLTYwLDcgKzY0LDcgQEAgc3RhdGljIHZvaWQgcnVuKHZv
aWQpCgogICAgICAgIFRTVF9DSEVDS1BPSU5UX1dBSVQoMCk7CgotICAgICAgIHdoaWxlIChwdGhy
ZWFkX3RyeWpvaW5fbnAodGhyLCBOVUxMKSA9PSBFQlVTWSkgeworICAgICAgIHdoaWxlICghdHN0
X2F0b21pY19sb2FkKCZjb21wbGV0ZWQpKSB7CiAgICAgICAgICAgICAgICBpZiAodHN0X3RpbWVv
dXRfcmVtYWluaW5nKCkgPD0gMTApIHsKICAgICAgICAgICAgICAgICAgICAgICAgcHRocmVhZF9j
YW5jZWwodGhyKTsKICAgICAgICAgICAgICAgICAgICAgICAgdHN0X2JyayhUQlJPSywKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
