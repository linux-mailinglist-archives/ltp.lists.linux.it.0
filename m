Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC0118002
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 06:53:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34ABA3C220C
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 06:53:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AB1033C2055
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 06:53:34 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B2FA56020BB
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 06:53:33 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id F18219F7F0;
 Tue, 10 Dec 2019 05:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1575957212; bh=JeV+OqTdxDzfJMFruHaulLzSfzS00gh2RdaCtCwseLo=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=T5nCT/Ug0ScjigITd6aB12Eb2SX0ko6aNe1ySl/Etpn09ThiDjWLmOjS5RA61gWwV
 FsEkpz6bgVNK5lxQwhez1Rt+L/nPeVo4tx9vYOSQ8inmlFI7VOo1DRcXtAPUgOfGRN
 NK+DNa8s25nGMZ0t+dnDygbqmE1Q8uU0ETUbeWLI=
To: Petr Vorel <pvorel@suse.cz>
References: <20191209064110.67975-1-lkml@jv-coder.de>
 <20191209222557.GA31054@dell5510>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <79cfa9ef-b122-b2e1-4051-e16eff04d6be@jv-coder.de>
Date: Tue, 10 Dec 2019 06:53:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191209222557.GA31054@dell5510>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: Add fifo library
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgp0aGFua3MgUGV0ci4KClNvbWUgY29tbWVudHM6Cj4+ICsjaW5jbHVkZSA8c3RkZGVmLmg+
Cj4+ICsjaW5jbHVkZSA8c3RkbGliLmg+Cj4+ICsjaW5jbHVkZSA8c3RkaW8uaD4KPj4gKyNpbmNs
dWRlIDx1bmlzdGQuaD4KPj4gKyNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KPj4gKyNpbmNsdWRlIDxz
eXMvc3RhdC5oPgo+PiArCj4+ICsjZGVmaW5lIFRTVF9OT19ERUZBVUxUX01BSU4KPj4gKyNpbmNs
dWRlICJ0c3RfdGVzdC5oIgo+PiArI2luY2x1ZGUgIm9sZF90bXBkaXIuaCIKPj4gKyNpbmNsdWRl
ICJ0c3RfZmlmby5oIgo+PiArCj4+ICsjaWZuZGVmIFBBVEhfTUFYCj4+ICsjaWZkZWYgTUFYUEFU
SExFTgo+PiArI2RlZmluZSBQQVRIX01BWAlNQVhQQVRITEVOCj4+ICsjZWxzZQo+PiArI2RlZmlu
ZSBQQVRIX01BWAkxMDI0Cj4+ICsjZW5kaWYKPj4gKyNlbmRpZgo+IEhtLCB0aGlzIGlzIGNvcHkg
cGFzdGUgZnJvbSBvbGQgdGVzdHMgKGFsbCB1c2UgdGVzdC5oLCBldmVuIHF1aXRlIG5ldyBhbmQg
Y2xlYW4gdGVzdHMvdHN0X3RtcGRpcl90ZXN0LmMpLgo+IEkgd29uZGVyIGlmIHRoaXMgaXMgc3Rp
bGwgcmVsZXZhbnQsIGNhbid0IHdlIHVzZSAjaW5jbHVkZSA8bGltaXRzLmg+PwpSaWdodCwgaWYg
dGhlcmUgaXMgbm90aGluZyBhZ2FpbnN0IHVzaW5nIGxpbWl0cy5oLCBJJ2xsIGNoYW5nZSBpdC4g
SSAKanVzdCB1c2VkIG90aGVyIGNvZGUgZm9yIHJlZmVyZW5jZSBmb3IgbXkgY29kZS4KPj4gKysr
IGIvdGVzdGNhc2VzL01ha2VmaWxlCj4+IEBAIC0yOCw3ICsyOCw3IEBAIGluY2x1ZGUgJCh0b3Bf
c3JjZGlyKS9pbmNsdWRlL21rL2Vudl9wcmUubWsKPj4gICAjIDEuIGtkdW1wIHNob3VsZG4ndCBi
ZSBjb21waWxlZCBieSBkZWZhdWx0LCBiZWNhdXNlIGl0J3MgcnVudGltZSBiYXNlZCBhbmQKPj4g
ICAjICAgIFdJTEwgY3Jhc2ggdGhlIGJ1aWxkIGhvc3QgKHRoZSB0ZXN0cyBuZWVkIHRvIGJlIGZp
eGVkIHRvIGp1c3QgYnVpbGQsIG5vdAo+PiAgICMgICAgcnVuKS4KPj4gLUZJTFRFUl9PVVRfRElS
UwkJOj0ga2R1bXAKPj4gK0ZJTFRFUl9PVVRfRElSUwkJOj0ga2R1bXAgb3Blbl9wb3NpeF90ZXN0
c3VpdGUgcmVhbHRpbWUga2VybmVsIG5ldHdvcmsgbWlzYwo+IEkgZ3Vlc3MgdGhpcyBpcyB1bnJl
bGF0ZWQgY2hhbmdlIGZvciB5b3VyIGRlYnVnLgpEYW1uLi4uIFRoaXMgaGFwcGVucyB0byBtZSBh
bGwgdGhlIHRpbWUsIGl0J3MgdGltZSBmb3IgY29uZmlndXJlIApzd2l0Y2hlcyA7KQo+Cj4+ICtb
ICIkVFNUX05FRURTX1RNUERJUiIgIT0gMSBdICYmIHRzdF9icmsgVENPTkYgImZpZm8gbGlicmFy
eSByZXF1aXJlcyBUU1RfTkVFRFNfVE1QRElSPTEiCj4gSWYgd2UgYXBwbHkgaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMjA2Mzk5LywgaXQgc2hvdWxkIGJlCj4gJFRTVF9ORUVE
U19UTVBESVI9MQpJIGRvbid0IGdldCBpdD8gVGhlIHBhdGggeW91IGxpbmtlZCBzZWVtcyB1bnJl
bGF0ZWQgdG8gbWUgYW5kIGRpZCB5b3UgbWVhbgpbwqAgIiRUU1RfTkVFRFNfVE1QRElSIiA9IDEg
XSB8fCAuLi4gPwo+ICsJWyAiJFRTVF9ORUVEU19GSUZPIiA9IDEgXSAmJiAuIHRzdF9maWZvLnNo
Cj4gSSdkIGxvYWQgaXQgYXQgdGhlIHRvcCwganVzdCBiZWxvdwo+IC4gdHN0X2Fuc2lfY29sb3Iu
c2gKPiAuIHRzdF9zZWN1cml0eS5zaApUaGUgd2F5IEkgaW1wbGVtZW50ZWQgaXQsIEkgY2FuJ3Qg
bG9hZCBpdCBhdCB0aGUgdG9wLCBiZWNhdXNlIAp0c3RfZmlmby5zaCByZXF1aXJlcwpUU1RfVE1Q
RElSIHRvIGJlIGFscmVhZHkgc2V0LCB3aGVuIGl0IGlzIGluY2x1ZGVkLgo+IEtpbmQgcmVnYXJk
cywKPiBQZXRyCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
