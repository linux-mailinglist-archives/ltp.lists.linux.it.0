Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 300042C841
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:03:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA0B1294AC5
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:03:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 331593EA2FF
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:03:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C155C1000DE6
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:03:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A311B053
 for <ltp@lists.linux.it>; Tue, 28 May 2019 14:03:36 +0000 (UTC)
Date: Tue, 28 May 2019 16:03:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190528140334.GA27526@rei>
References: <20190520055038.11499-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520055038.11499-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v1 1/2] syscalls/fstat{01,02}: rewrote testcases
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

SGkhCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc3RhdC9mc3RhdC5oCj4gQEAg
LTAsMCArMSwzNCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKGMpIFNVU0UgTExDLCAyMDE5Cj4gKyAqIEF1dGhv
cjogQ2hyaXN0aWFuIEFtYW5uIDxjYW1hbm5Ac3VzZS5jb20+Cj4gKyAqLwo+ICsKPiArI2lmbmRl
ZiBfX0ZTVEFUX0hfXwo+ICsjZGVmaW5lIF9fRlNUQVRfSF9fCj4gKwo+ICsjaW5jbHVkZSA8c3lz
L3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDxzeXMvc3RhdC5oPgo+ICsjaW5jbHVkZSA8dW5pc3RkLmg+
Cj4gKyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gKwo+ICsjZGVmaW5lIFRFU1RfVkFSSUFO
VFMJMgo+ICsjZGVmaW5lIFRFU1RGSUxFCSJ0ZXN0X2ZpbGUiCj4gKwo+ICtzdGF0aWMgdm9pZCBz
eXNjYWxsX2luZm8odm9pZCkKPiArewo+ICsJaWYgKHRzdF92YXJpYW50ID09IDApIHsKPiArCQl0
c3RfcmVzKFRJTkZPLCAiVGVzdGluZyBsaWJjIGZzdGF0KCkiKTsKPiArCQlyZXR1cm47Cj4gKwl9
Cj4gKwl0c3RfcmVzKFRJTkZPLCAiVGVzdGluZyBzeXNjYWxsIGZzdGF0KCkiKTsKPiArfQo+ICsK
PiArc3RhdGljIGludCB0c3RfZnN0YXQoaW50IGZkLCBzdHJ1Y3Qgc3RhdCAqc3RhdGJ1ZikKPiAr
ewo+ICsJaWYgKHRzdF92YXJpYW50ID09IDApCj4gKwkJcmV0dXJuIGZzdGF0KGZkLCBzdGF0YnVm
KTsKPiArCXJldHVybiB0c3Rfc3lzY2FsbChfX05SX2ZzdGF0LCBmZCwgc3RhdGJ1Zik7Cj4gK30K
CkhhdmUgeW91IHRlc3RlZCB0aGlzIHdyYXBwZXIgd2l0aCAzMmJpdCBiaW5hcnk/CgpCZWNhdXNl
IG9uIHg4NiAoYW1vbmcgb3RoZXJzKSB3ZSBkbyBoYXZlIGZzdGF0IGFuZCBmc3RhdDY0IHRoYXQg
ZGlmZmVyCmluIHRoZSBzdGF0YnVmIHN0cnVjdHVyZSBzaXplIChzZWUgbWFuIGZzdGF0IE5PVEVT
KS4gSWYgSSBhZGQgYSBwcmludGYoKQp0byBwcmludCBzaXplb2Yoc3RydWN0IHN0YXQpIHRvIHRo
ZSBmc3RhdDAxLmMgdGVzdCBvbiB4ODYgSSBnZXQgOTYgYnl0ZXMKd2l0aCBfRklMRV9PRkZTRVRf
QklUUz02NCBhbmQgODggd2l0aG91dCwgc28gSSBndWVzcyB0aGF0IHRoaXMgdXNlcwp3cm9uZyBz
eXNjYWxsIHdpdGggdGhlIF9GSUxFX09GRlNFVF9CSVRTPTY0IGRlZmluZWQuCgpBbmQgYWN0dWFs
bHkgdGhlcmUgYXJlIHRocmVlIGZzdGF0IHZhcmlhbnRzIHRoZXJlLCB0aGUgb2xkX2ZzdGF0LCBm
c3RhdAphbmQgZnN0YXQ2NCwgd2UgY291bGQgcHJvYmFibHkgdGVzdCBhbGwgdGhyZWUgdmFyaWFu
dHMgYnV0IEkgZ3Vlc3MgdGhhdApvbGRfZnN0YXQgaXMgYWN0dWFsbHkgbm90IHdvcnRoIG9mIHRo
ZSBlZmZvcnQuLi4KCkhJTlQ6IFlvdSBjYW4gY29tcGlsZSAzMmJpdCBMVFAgb24gNjRiaXQgZGlz
dHJpYnV0aW9uIHdpdGg6CiAgICAgIC4vY29uZmlndXJlIENGTEFHUz0tbTMyIExERkxBR1M9LW0z
Mi4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
