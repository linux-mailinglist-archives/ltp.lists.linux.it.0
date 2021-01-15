Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B346F2F72C1
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:13:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E9043C3122
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:13:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 864093C2657
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:13:42 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9D5491A0009C
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:13:41 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 42EB1A1498;
 Fri, 15 Jan 2021 06:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1610691219; bh=7OSavPcw19tztGiRVpHjmkOArhl8V1734+JFytL1HJ0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=tr0IKVY8zjfaPOdxqGl36AzNymeGfMtel8rqftSFHEMjjyd9/XQ8JQ1YUBinbE6Ni
 bbveKuwVAOwAJbdii45nEzLge0rx+SROXI9hnj2j4EDn5/BAgs+caC0+Sgio+3UT1G
 cyg1XKalloZXHdfCe0tuzKZnkKwqxrGBpFogHuHw=
To: =?UTF-8?B?R2FvIE1laXRhb++8iOmrmOeOq+a2m++8iQ==?=
 <meitaogao@asrmicro.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Cyril Hrubis <chrubis@suse.cz>
References: <0efaa481ffd24bc48fd41385159be66c@exch01.asrmicro.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <f3136f18-edd5-08b7-a720-72baeeed7fbc@jv-coder.de>
Date: Fri, 15 Jan 2021 07:14:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0efaa481ffd24bc48fd41385159be66c@exch01.asrmicro.com>
Content-Language: en-US
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP testcase(sysctl02) failed
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

SGkgR2FvLAoKT24gMTIvMjQvMjAyMCA2OjU2IEFNLCBHYW8gTWVpdGFv77yI6auY546r5rab77yJ
IHdyb3RlOgo+Cj4gYWZ0ZXIgaW52ZXN0aWdhdGVkIGl0LCB0aGlzIHRlc3RjYXNlIGlzIGZvciBi
dWZmZmVyIG92ZXJmbG93LCBJIAo+IGNoZWNrZWQgc291cmNlIGNvZGUgKGtlcm5lbCA0LjE5KSwK
Pgo+IGFsbCBvZiByZXF1aXJlZCBwYXRjaGVkIGhhZCBiZWVuIGFwcGxpZWQsIEkgZGlnIGludG8g
aXQgYW5kIGZvdW5kIG5ldyAKPiBwYXRjaCBhcHBsaWVkIGFzIGZsb3cgLCB0aGF0IG1pZ2h0IG1h
a2UgdGVzdGNhc2UgZmFpbGVkCj4KPiBzbyBpcyB0aGlzIHRlc3RjYXNlIG91dCBvZiBkYXRlIG9y
IHNvbWV0aGluZyB3cm9uZyB3aWggbXkga2VybmVsID8KPgo+IHdobyBjYW4gaGVscCBtZSBmaWd1
cmUgdGhpcyBvdXQ/IFRoYW5rcyBpbiBhZHZhbmNlLgo+CkkgYWxzbyBzYXcgdGhpcyBvbiA0LjE5
LiBGcm9tIHRoZSBtYWlsaW5nIGxpc3Qgb2YgdGhlIGtlcm5lbCwgaXQgbG9va3MgCmxpa2UgdGhl
cmUgd2FzIHNvbWUgY29uZnVzaW9uIHdoZW4gdGhleSBwb3J0ZWQgdGhlIHBhdGNoZXMgYmFjayB0
byA0LjE5LgpJIGRvIG5vdCBmaW5kIHRoZSBtYWlscyBvbiB0aGUgbWFpbGluZyBsaXN0IGFueW1v
cmUuIEJ1dCB0aGUgY29tbWl0IAo3ZjI5MjNjIGZyb20gbWFzdGVyIGlzIG1pc3NpbmcgSUlSQy4K
Q2hyaXN0aWFuIEJyYXVuZXIgbWFkZSB0d28gY2hhbmdlczoKMS4gUHJldmVudCBvdmVyIGFuZCB1
bmRlcmZsb3cgYnkganVzdCBrZWVwaW5nIHRoZSBvbGQgdmFsdWUgKDdmMjkyM2MgCnRvZ2V0aGVy
IHdpdGggMzJhNWFkOWMpLiBUaGlzIGludHJvZHVjZWQgYSBrYXNhbiBidWcgZml4ZWQgaW4gOTAw
MmIyMQoyLiBSZXR1cm4gRUlOVkFMLCBpZiBhbiBvdmVyZmxvdyBvciB1bmRlcmZsb3cgb2YgdGhl
IG5ldyB2YWx1ZSBpcyAKZGV0ZWN0ZWQgKGUyNjBhZDAxZikKCiBGcm9tIHdoYXQgSSByZW1lbWJl
ciBDaHJpc3RpYW4gd2FudGVkIHRoZSBmaXJzdCBjaGFuZ2UgY29tcGxldGVseSAKYmFja3BvcnRl
ZCB0byA0LjE5ICg3ZjI5MjNjLCAzMmE1YWQ5YyBhbmQgOTAwMmIyMSkgYW5kIGhlIHdhbnRlZCB0
byBvbWl0IAp0aGUgY2hhbmdlIGRvbmUgaW4gZTI2MGFkMDFmLCBiZWNhdXNlIHRoYXQgY2hhbmdl
ZCB0aGUgYmVoYXZpb3Igb2YgdGhlIAppbnRlcmZhY2UgdG93YXJkcyB0aGUgdXNlci4KQnV0IHdo
ZW4gdGhlIGNoYW5nZWQgd2VyZSBiYWNrcG9ydGVkIHRvIDQuMTksIHRoZSBjb21taXQgMzJhNWFk
OWMsIAo5MDAyYjIxIGFuZCBlMjYwYWQwMWYgd2VyZSBiYWNrcG9ydGVkLiBTaW5jZSA3ZjI5MjNj
IGlzIHRoZSBjb21taXQsIHRoYXQgCnJlYWxseSBlbmFibGVzIG92ZXItIGFuZCB1bmRlcmZsb3cg
ZGV0ZWN0aW9uLCB0aGlzIGlzIG5vdCBiYWNrcG9ydGVkIGFuZCAKYWxsIHRoZSBvdGhlciBjb21t
aXQgKGluY2x1ZGluZyBlMjYwYWQwMWYpIGhhdmUgbm8gZWZmZWN0LgoKQXQgdGhlIHRpbWUgSSBm
b3VuZCB0aGlzLCBJIGhhZCBubyB0aW1lIHRvIGZpbmQgb3V0IGhvdyBhbmQgd2hlcmUgdG8gCnJl
cG9ydCB0aGlzLgpAQ3lyaWwgSSBndWVzcyB5b3UgbWF5IGtub3cgaG93IGFuZCB3aG8gdG8gcmVw
b3J0IHRoaXMgdG8/CgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
