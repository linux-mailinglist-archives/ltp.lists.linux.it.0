Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA0AADD3E
	for <lists+linux-ltp@lfdr.de>; Wed,  7 May 2025 13:24:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 747ED3CBDC5
	for <lists+linux-ltp@lfdr.de>; Wed,  7 May 2025 13:24:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 103E53C4C12
 for <ltp@lists.linux.it>; Wed,  7 May 2025 13:23:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 49985200769
 for <ltp@lists.linux.it>; Wed,  7 May 2025 13:23:55 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FA4F211A9;
 Wed,  7 May 2025 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1746617033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ES2DBvtHRDDDuFoxBdP5xPs6Gs9DN5uY2FOX2Bus0NE=;
 b=lMjfhQa/9FOHHoZ/OoPLxhGp+n9d8bgXGYM8nUUxEAgQdKAa+Ym8ncnmG+GBmD+RZh00KT
 aEFjFBoADmbNkUJt1OI/DFChFttgJwoN8etX+YjtILGry0cCrkYf9blllBNo/7fyMkv2bh
 XGyLbNjxloCo5NCnptKu3M5UiTUfmV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1746617033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ES2DBvtHRDDDuFoxBdP5xPs6Gs9DN5uY2FOX2Bus0NE=;
 b=9xj9byH2y+S1Hkt/RImz/hO62TUJ6Qrcje8RO2zagMt868a6XuJ359WrYbmYgP/4mLbGlB
 cf/zzZ+dAeYiuFDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1746617033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ES2DBvtHRDDDuFoxBdP5xPs6Gs9DN5uY2FOX2Bus0NE=;
 b=lMjfhQa/9FOHHoZ/OoPLxhGp+n9d8bgXGYM8nUUxEAgQdKAa+Ym8ncnmG+GBmD+RZh00KT
 aEFjFBoADmbNkUJt1OI/DFChFttgJwoN8etX+YjtILGry0cCrkYf9blllBNo/7fyMkv2bh
 XGyLbNjxloCo5NCnptKu3M5UiTUfmV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1746617033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ES2DBvtHRDDDuFoxBdP5xPs6Gs9DN5uY2FOX2Bus0NE=;
 b=9xj9byH2y+S1Hkt/RImz/hO62TUJ6Qrcje8RO2zagMt868a6XuJ359WrYbmYgP/4mLbGlB
 cf/zzZ+dAeYiuFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D5A213882;
 Wed,  7 May 2025 11:23:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8IVbHclCG2htHgAAD6G6ig
 (envelope-from <mdoucha@suse.cz>); Wed, 07 May 2025 11:23:53 +0000
Message-ID: <ebc69f6d-5f50-4fce-860a-bdf8a9d041bb@suse.cz>
Date: Wed, 7 May 2025 13:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Linux Test Project <ltp@lists.linux.it>
References: <20250429-conversions-modify_ldt-v9-0-97e4664c25c5@suse.com>
 <20250429-conversions-modify_ldt-v9-1-97e4664c25c5@suse.com>
Content-Language: en-US
From: Martin Doucha <mdoucha@suse.cz>
Autocrypt: addr=mdoucha@suse.cz; keydata=
 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 ag==
In-Reply-To: <20250429-conversions-modify_ldt-v9-1-97e4664c25c5@suse.com>
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v9 1/3] syscalls/modify_ldt: Add lapi/ldt.h
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCm9uZSBtb3JlIHRoaW5nIGZvciBjdmUtMjAxNS0zMjkwIGJlbG93LgoKT24gMjkuIDA0LiAy
NSAxMjo0NCwgUmljYXJkbyBCLiBNYXJsacOocmUgdmlhIGx0cCB3cm90ZToKPiBGcm9tOiBSaWNh
cmRvIEIuIE1hcmxpw6hyZSA8cmJtQHN1c2UuY29tPgo+IAo+IEFkZCBhIHdyYXBwZXIgdG8gbW9k
aWZ5X2xkdCBhbmQgYSBmYWxsYmFjayBkZWZpbml0aW9uIHRvIHN0cnVjdCB1c2VyX2Rlc2MsCj4g
d2hpY2ggYXJlIG5lZWRlZCBpbiBhIGZldyB0ZXN0cyBhbmQgc2hvdWxkIGJlIHJldXNlZC4KPiAK
PiBSZXZpZXdlZC1ieTogQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+Cj4gUmV2aWV3ZWQt
Ynk6IEFuZHJlYSBDZXJ2ZXNhdG8gPGFuZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogUmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4KPiAtLS0KPiAgIGlu
Y2x1ZGUvbGFwaS9sZHQuaCAgICAgICAgICAgICAgICAgICAgICB8IDU5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAgdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNS0zMjkwLmMgICAg
ICAgICAgIHwgMjYgKystLS0tLS0tLS0tLS0tCj4gICB0ZXN0Y2FzZXMvY3ZlL2N2ZS0yMDE3LTE3
MDUzLmMgICAgICAgICAgfCAgNiArKy0tCj4gICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zv
cmsvZm9yazA1LmMgfCAgNSArKy0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygr
KSwgMzEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGFwaS9sZHQuaCBi
L2luY2x1ZGUvbGFwaS9sZHQuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNmI1YTJkNTljYjQxYmZjMjRlYjVh
YzI2YzNkNDdkNDlmYjhmZjc4Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2xhcGkv
bGR0LmgKPiBAQCAtMCwwICsxLDU5IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9yLWxhdGVyICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBTVVNFIExM
QyBSaWNhcmRvIEIuIE1hcmxpw6hyZSA8cmJtQHN1c2UuY29tPgo+ICsgKi8KPiArCj4gKyNpZm5k
ZWYgTEFQSV9MRFRfSF9fCj4gKyNkZWZpbmUgTEFQSV9MRFRfSF9fCj4gKwo+ICsjaW5jbHVkZSAi
Y29uZmlnLmgiCj4gKyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gKwo+ICsjaWZkZWYgSEFW
RV9BU01fTERUX0gKPiArI2luY2x1ZGUgPGFzbS9sZHQuaD4KPiArI2Vsc2UKPiArc3RydWN0IHVz
ZXJfZGVzYyB7Cj4gKwl1bnNpZ25lZCBpbnQgZW50cnlfbnVtYmVyOwo+ICsJdW5zaWduZWQgaW50
IGJhc2VfYWRkcjsKPiArCXVuc2lnbmVkIGludCBsaW1pdDsKPiArCXVuc2lnbmVkIGludCBzZWdf
MzJiaXQgOiAxOwo+ICsJdW5zaWduZWQgaW50IGNvbnRlbnRzIDogMjsKPiArCXVuc2lnbmVkIGlu
dCByZWFkX2V4ZWNfb25seSA6IDE7Cj4gKwl1bnNpZ25lZCBpbnQgbGltaXRfaW5fcGFnZXMgOiAx
Owo+ICsJdW5zaWduZWQgaW50IHNlZ19ub3RfcHJlc2VudCA6IDE7Cj4gKwl1bnNpZ25lZCBpbnQg
dXNlYWJsZSA6IDE7Cj4gKyNpZmRlZiBfX3g4Nl82NF9fCj4gKwl1bnNpZ25lZCBpbnQgbG0gOiAx
Owo+ICsjZW5kaWYgLyogX194ODZfNjRfXyAqLwo+ICt9Owo+ICsjZW5kaWYgLyogSEFWRV9BU01f
TERUX0ggKi8KPiArCj4gK3N0YXRpYyBpbmxpbmUgaW50IG1vZGlmeV9sZHQoaW50IGZ1bmMsIGNv
bnN0IHN0cnVjdCB1c2VyX2Rlc2MgKnB0ciwKPiArCQkJICAgICB1bnNpZ25lZCBsb25nIGJ5dGVj
b3VudCkKPiArewo+ICsJcmV0dXJuIHRzdF9zeXNjYWxsKF9fTlJfbW9kaWZ5X2xkdCwgZnVuYywg
cHRyLCBieXRlY291bnQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGludCBzYWZlX21vZGlm
eV9sZHQoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywgaW50IGZ1bmMsCj4gKwkJ
CQkgIGNvbnN0IHN0cnVjdCB1c2VyX2Rlc2MgKnB0ciwKPiArCQkJCSAgdW5zaWduZWQgbG9uZyBi
eXRlY291bnQpCj4gK3sKPiArCWludCBydmFsOwo+ICsKPiArCXJ2YWwgPSBtb2RpZnlfbGR0KGZ1
bmMsIHB0ciwgYnl0ZWNvdW50KTsKPiArCWlmIChydmFsID09IC0xKSB7Cj4gKwkJdHN0X2Jya18o
ZmlsZSwgbGluZW5vLCBUQlJPSyB8IFRFUlJOTywKPiArCQkJICJtb2RpZnlfbGR0KCVkLCAlcCwg
JWx1KSIsIGZ1bmMsIHB0ciwgYnl0ZWNvdW50KTsKPiArCX0gZWxzZSBpZiAocnZhbCkgewo+ICsJ
CXRzdF9icmtfKGZpbGUsIGxpbmVubywgVEJST0sgfCBURVJSTk8sCj4gKwkJCSAibW9kaWZ5X2x0
ZCglZCwgJXAsICVsdSkgaW52YWxpZCByZXR2YWwgJWkiLCBmdW5jLCBwdHIsCj4gKwkJCSBieXRl
Y291bnQsIHJ2YWwpOwo+ICsJfQo+ICsKPiArCXJldHVybiBydmFsOwo+ICt9Cj4gKwo+ICsjZGVm
aW5lIFNBRkVfTU9ESUZZX0xEVChmdW5jLCBwdHIsIGJ5dGVjb3VudCkgXAo+ICsJc2FmZV9tb2Rp
ZnlfbGR0KF9fRklMRV9fLCBfX0xJTkVfXywgKGZ1bmMpLCAocHRyKSwgKGJ5dGVjb3VudCkpCj4g
Kwo+ICsjZW5kaWYgLyogTEFQSV9MRFRfSF9fICovCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9j
dmUvY3ZlLTIwMTUtMzI5MC5jIGIvdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNS0zMjkwLmMKPiBpbmRl
eCA2M2U1ZDkyYzkxYjgzMGNkODA2NmE2YTZjMzI5NDYxYjcyNzMxZjMyLi44ZWMxZDUzYmJiNWE5
ZjNlNzc2MWQzOTg1NWQzNGY1OTNlMTE4YTI4IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9jdmUv
Y3ZlLTIwMTUtMzI5MC5jCj4gKysrIGIvdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNS0zMjkwLmMKPiBA
QCAtMTIzLDE2ICsxMjMsMTQgQEAgcGVyaGFwcyB1bnN1cnByaXNpbmdseS4pCj4gICAjaW5jbHVk
ZSA8c3RkbGliLmg+Cj4gICAjaW5jbHVkZSA8c3RkaW8uaD4KPiAgICNpbmNsdWRlIDxpbnR0eXBl
cy5oPgo+IC0jaW5jbHVkZSA8YXNtL2xkdC5oPgo+ICAgI2luY2x1ZGUgPHVuaXN0ZC5oPgo+IC0j
aW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KPiAgICNpbmNsdWRlIDxzZXRqbXAuaD4KPiAgICNpbmNs
dWRlIDxzaWduYWwuaD4KPiAgICNpbmNsdWRlIDxzdHJpbmcuaD4KPiAgICNpbmNsdWRlIDxzeXMv
d2FpdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3BlcmZfZXZlbnQuaD4KPiAgIAo+IC0jaW5jbHVk
ZSAibGFwaS9zeXNjYWxscy5oIgo+ICsjaW5jbHVkZSAibGFwaS9sZHQuaCIKPiAgICNpbmNsdWRl
ICJ0c3Rfc2FmZV9wdGhyZWFkLmgiCj4gICAKPiAgIC8qIEFic3RyYWN0aW9ucyBmb3Igc29tZSAz
Mi1iaXQgdnMgNjQtYml0IGRpZmZlcmVuY2VzLiAqLwo+IEBAIC0xOTksMjcgKzE5Nyw3IEBAIHN0
YXRpYyB2b2lkIHNldF9sZHQodm9pZCkKPiAgIAkJLnVzZWFibGUJID0gMAo+ICAgCX07Cj4gICAK
PiAtCVRFU1QodHN0X3N5c2NhbGwoX19OUl9tb2RpZnlfbGR0LCAxLCAmZGF0YV9kZXNjLCBzaXpl
b2YoZGF0YV9kZXNjKSkpOwo+IC0KPiAtCS8qCj4gLQkgKiBUaGUga2VybmVsIGludGVudGlvbmFs
bHkgY2FzdHMgbW9kaWZ5X2xkdCgpIHJldHVybiB2YWx1ZQo+IC0JICogdG8gdW5zaWduZWQgaW50
IHRvIHByZXZlbnQgc2lnbiBleHRlbnNpb24gdG8gNjQgYml0cy4gVGhpcyBtYXkKPiAtCSAqIHJl
c3VsdCBpbiBzeXNjYWxsKCkgcmV0dXJuaW5nIHRoZSB2YWx1ZSBhcyBpcyBpbnN0ZWFkIG9mIHNl
dHRpbmcKPiAtCSAqIGVycm5vIGFuZCByZXR1cm5pbmcgLTEuCj4gLQkgKi8KPiAtCWlmIChUU1Rf
UkVUID4gMCAmJiAoKGludClUU1RfUkVUKSA8IDApIHsKPiAtCQl0c3RfcmVzKFRJTkZPLAo+IC0J
CQkiV0FSTklORzogTGliYyBtaXNoYW5kbGVkIG1vZGlmeV9sZHQoKSByZXR1cm4gdmFsdWUiKTsK
PiAtCQlUU1RfRVJSID0gLShpbnQpVFNUX1JFVDsKPiAtCQlUU1RfUkVUID0gLTE7Cj4gLQl9Cj4g
LQo+IC0JaWYgKFRTVF9SRVQgPT0gLTEgJiYgVFNUX0VSUiA9PSBFSU5WQUwpIHsKPiAtCQl0c3Rf
YnJrKFRDT05GIHwgVFRFUlJOTywKPiAtCQkJIm1vZGlmeV9sZHQ6IDE2LWJpdCBkYXRhIHNlZ21l
bnRzIGFyZSBwcm9iYWJseSBkaXNhYmxlZCIpOwoKVGhlcmUncyBhIFRDT05GIGhlcmUgaWYgbW9k
aWZ5X2xkdCgpIHJldHVybnMgRUlOVkFMLiBTQUZFX01PRElGWV9MRFQoKSAKd2lsbCB0cmVhdCB0
aGF0IGFzIGZhaWx1cmUgaW5zdGVhZC4gRUlOVkFMIGlzIGV4cGVjdGVkLgoKPiAtCX0gZWxzZSBp
ZiAoVFNUX1JFVCAhPSAwKSB7Cj4gLQkJdHN0X2JyayhUQlJPSyB8IFRURVJSTk8sICJtb2RpZnlf
bGR0Iik7Cj4gLQl9Cj4gKwlTQUZFX01PRElGWV9MRFQoMSwgJmRhdGFfZGVzYywgc2l6ZW9mKGRh
dGFfZGVzYykpOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCB0cnlfY29ycnVwdF9zdGFjayh1
bnNpZ25lZCBzaG9ydCAqb3JpZ19zcykKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2N2ZS9jdmUt
MjAxNy0xNzA1My5jIGIvdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNy0xNzA1My5jCj4gaW5kZXggZmU3
YjZkNjk0ZDZmZmJiY2U4NjNhYmMxNjcyZTAzYWU1ZjQxOWRmMS4uZWM3YTUzNGE2YzAxMDRlNjY4
OGYyMDRkNzYzYzMxZWQ3YTA0ODIwMSAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMvY3ZlL2N2ZS0y
MDE3LTE3MDUzLmMKPiArKysgYi90ZXN0Y2FzZXMvY3ZlL2N2ZS0yMDE3LTE3MDUzLmMKPiBAQCAt
MTcsMTYgKzE3LDE0IEBACj4gICAjaW5jbHVkZSAidHN0X3Rlc3QuaCIKPiAgIAo+ICAgI2lmZGVm
IEhBVkVfQVNNX0xEVF9ICj4gLSNpbmNsdWRlIDxhc20vbGR0Lmg+Cj4gICAjaW5jbHVkZSA8cHRo
cmVhZC5oPgo+ICAgI2luY2x1ZGUgPHNpZ25hbC5oPgo+ICAgI2luY2x1ZGUgPHN0ZGxpYi5oPgo+
IC0jaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KPiAgICNpbmNsdWRlIDxzeXMvd2FpdC5oPgo+ICAg
I2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gICAKPiAtI2luY2x1
ZGUgImxhcGkvc3lzY2FsbHMuaCIKPiArI2luY2x1ZGUgImxhcGkvbGR0LmgiCj4gICAKPiAgICNk
ZWZpbmUgRVhFQ19VU0VDICAgNTAwMDAwMAo+ICAgCj4gQEAgLTEwOSw3ICsxMDcsNyBAQCB2b2lk
IHJ1bl90ZXN0KHZvaWQpCj4gICAJc3RydWN0IHVzZXJfZGVzYyBkZXNjID0geyAuZW50cnlfbnVt
YmVyID0gODE5MSB9Owo+ICAgCj4gICAJaW5zdGFsbF9zaWdoYW5kbGVyKCk7Cj4gLQlzeXNjYWxs
KF9fTlJfbW9kaWZ5X2xkdCwgMSwgJmRlc2MsIHNpemVvZihkZXNjKSk7Cj4gKwlTQUZFX01PRElG
WV9MRFQoMSwgJmRlc2MsIHNpemVvZihkZXNjKSk7Cj4gICAKPiAgIAlmb3IgKDs7KSB7Cj4gICAJ
CWlmIChzaG0tPmRvX2V4aXQpCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvZm9yay9mb3JrMDUuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZm9yay9mb3JrMDUu
Ywo+IGluZGV4IDIyZWRlZmMzNjg2OTc4ZmJiOTQ1M2RmZmFiZmNiY2NiN2VhNmJiMTIuLjlhYTEy
ZTE2MjAxZGVjOGYzZDJhNGM5OWRmODNjNGU1ZTI1ZWY4NTcgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mb3JrL2ZvcmswNS5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9mb3JrL2ZvcmswNS5jCj4gQEAgLTU1LDggKzU1LDcgQEAKPiAgIAo+ICAgI2lm
IGRlZmluZWQoX19pMzg2X18pCj4gICAKPiAtI2luY2x1ZGUgImxhcGkvc3lzY2FsbHMuaCIKPiAt
I2luY2x1ZGUgPGFzbS9sZHQuaD4KPiArI2luY2x1ZGUgImxhcGkvbGR0LmgiCj4gICAKPiAgIHN0
YXRpYyB2b2lkIHJ1bih2b2lkKQo+ICAgewo+IEBAIC03Niw3ICs3NSw3IEBAIHN0YXRpYyB2b2lk
IHJ1bih2b2lkKQo+ICAgCWxkdDAuc2VnX25vdF9wcmVzZW50ID0gMDsKPiAgIAlsZHQwLnVzZWFi
bGUgPSAxOwo+ICAgCj4gLQl0c3Rfc3lzY2FsbChfX05SX21vZGlmeV9sZHQsIDEsICZsZHQwLCBz
aXplb2YobGR0MCkpOwo+ICsJU0FGRV9NT0RJRllfTERUKDEsICZsZHQwLCBzaXplb2YobGR0MCkp
Owo+ICAgCj4gICAJYXNtIHZvbGF0aWxlICgibW92dyAldzAsICUlZnMiOjoicSIgKDcpKTsKPiAg
IAlhc20gdm9sYXRpbGUgKCJtb3ZsICUlZnM6MCwgJTAiOiI9ciIgKGxvKSk7Cj4gCgoKLS0gCk1h
cnRpbiBEb3VjaGEgICBtZG91Y2hhQHN1c2UuY3oKU1cgUXVhbGl0eSBFbmdpbmVlcgpTVVNFIExJ
TlVYLCBzLnIuby4KQ09SU08gSUlhCktyaXppa292YSAxNDgvMzQKMTg2IDAwIFByYWd1ZSA4CkN6
ZWNoIFJlcHVibGljCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
