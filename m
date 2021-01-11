Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EF2F0CF9
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 07:43:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 864043C5FC8
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 07:43:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C494B3C25C8
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 07:43:33 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EA29E1A007F2
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 07:43:32 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B14E7A07FD;
 Mon, 11 Jan 2021 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1610347409; bh=Vd0UISNoRRSXg6AOO7m48fBhhPrbDnSgOJeQ5OJ0Axg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=njmrADXfsd7gv0yKb0hUVQYqpg7/fQ3Qj0lN5204B7BOGhRbtKIKgxbT6dIS0bxLZ
 oJEHUxChnp6LNy1G6xxpJ+zNB5BnPleUG2i4wo6of+YoKsO6ZHLFQZ7Qf3rbLmgiaJ
 B4N6dwtXZ7k4Y+TSVMEbdWNV4hGKe+9F09f0tJW8=
To: Petr Vorel <pvorel@suse.cz>
References: <20201125053459.3314021-1-lkml@jv-coder.de>
 <20201221221838.GC4453@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <d575ea47-142c-2ff3-1a55-58fc8f55801b@jv-coder.de>
Date: Mon, 11 Jan 2021 07:44:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221221838.GC4453@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 1/3] network/stress/multicast/packet-flood:
 Update to new API
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

SGkgUGV0ciwKCk9uIDEyLzIxLzIwMjAgMTE6MTggUE0sIFBldHIgVm9yZWwgd3JvdGU6Cj4gSGkg
Sm9lcmcsCj4KPgo+IE1pbm9yIGNvbW1lbnRzLCBwbGVhc2UgdXBkYXRlIHRoZW0gaWYgdjQgbmVl
ZGVkLgo+IE90aGVyd2lzZSBpdCBjYW4gYmUgZml4ZWQgZHVyaW5nIG1lcmdlLgo+IFRoYW5rcyBm
b3IgeW91ciB3b3JrLgpJIGRvbid0IHRoaW5rIEknbGwgc3VibWl0IGEgdjQsIGlmIHlvdSB3YW50
IHRvIGZpeCB0aGlzIGR1cmluZyBtZXJnZSwgaXQgCmlzIG9rIHRvIG1lLgo+Cj4gUmV2aWV3ZWQt
Ynk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+Cj4gS2luZCByZWdhcmRzLAo+IFBldHIK
Pgo+PiArKysgYi90ZXN0Y2FzZXMvbmV0d29yay9zdHJlc3MvbXVsdGljYXN0L3BhY2tldC1mbG9v
ZC9tY2FzdC1wa3RmbGQwMi5zaAo+PiBAQCAtMCwwICsxLDU1IEBACj4+ICsjIS9iaW4vc2gKPj4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPj4gKyMgQ29weXJp
Z2h0IChjKSAyMDA2IEludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgIENvcnAuCj4+ICsj
IENvcHlyaWdodCAoYykgMjAyMCBKb2VyZyBWZWhsb3cgPGpvZXJnLnZlaGxvd0Bhb3gtdGVjaC5k
ZT4KPj4gKyMgQXV0aG9yOiBNaXRzdXJ1IENoaW5lbiA8bWl0Y2hAanAuaWJtLmNvbT4KPj4gKyMK
Pj4gKyMgVmVyaWZ5IHRoYXQgdGhlIGtlcm5lbCBpcyBub3QgY3Jhc2hlZCB3aGVuIGpvaW5pbmcg
bXVsdGlwbGUgbXVsdGljYXN0Cj4+ICsjIGdyb3VwcyBvbiBzZXBhcmF0ZSBzb2NrZXRzLCB0aGVu
IHJlY2VpdmluZyBhIGxhcmdlIG51bWJlciBvZiBVRFAKPj4gKyMgcGFja2V0cyBhdCBlYWNoIHNv
Y2tldAo+PiArCj4+ICtUU1RfTkVFRFNfUk9PVD0xCj4+ICsuIG1jYXN0LWxpYi5zaAo+PiArCj4+
ICtkb19zZXR1cCgpCj4+ICt7Cj4+ICsJbWNhc3Rfc2V0dXAgJG5fTk9STUFMCj4KPiBUaGlzIHNo
b3VsZCBiZSAoZXJyb3IgZHVyaW5nIGdsb2JhbCByZXBsYWNlKToKPgo+IAltY2FzdF9zZXR1cCAk
TUNBU1ROVU1fTk9STUFMClllcyBzb3JyeS4uLgo+Cj4+ICsJTUNBU1RfTENNRD1ucy1tY2FzdF9y
ZWNlaXZlcgo+PiArCU1DQVNUX1JDTUQ9bnMtdWRwc2VuZGVyCj4+ICt9Cj4+ICsKPj4gK2RvX3Rl
c3QoKQo+PiArewo+PiArCXRzdF9yZXMgVElORk8gIlZlcmlmeSB0aGF0IHRoZSBrZXJuZWwgaXMg
bm90IGNyYXNoZWQgd2hlbiBqb2luaW5nICRNQ0FTVE5VTV9OT1JNQUwgSVB2JHtUU1RfSVBWRVJ9
IG11bHRpY2FzdCBncm91cHMgb24gc2VwYXJhdGUgc29ja2V0cywgdGhlbiByZWNlaXZpbmcgYSBs
YXJnZSBudW1iZXIgb2YgVURQIHBhY2tldHMgYXQgZWFjaCBzb2NrZXQgaW4gJE5TX0RVUkFUSU9O
IHNlY29uZHMiCj4gSSdkIHByZWZlciB0aGVzZSBkcm9wIGJvaWxlcnBsYXRlICJWZXJpZnkgdGhh
dCB0aGUga2VybmVsIGlzIG5vdCBjcmFzaGVkIHdoZW4iCj4gKyB0aGUgc2FtZSBpbiB0aGUgZGVz
Y3JpcHRpb24gYXQgdGhlIHRvcCBvZiB0aGUgZmlsZS4KRG8geW91IHdhbnQgdGhpcyBjb21wbGV0
ZWx5IHJlbW92ZWQ/IEkgYWRkZWQgdGhpcywgYmVjYXVzZSB5b3UgYXNrZWQgbWUgCnRvIGluIHYy
Pwo+Cj4+ICsKPj4gKwlsb2NhbCBuPTAKPj4gKwl3aGlsZSBbICRuIC1sdCAkTUNBU1ROVU1fTk9S
TUFMIF07IGRvCj4+ICsJCSMgRGVmaW5lIHRoZSBtdWx0aWNhc3QgYWRkcmVzcwo+PiArCQlpZiBb
ICIkVFNUX0lQVjYiIF07IHRoZW4KPj4gKyAgICAJCWxvY2FsIG5faGV4PSQocHJpbnRmICIleCIg
JG4pCj4+ICsgICAgCQlsb2NhbCBhZGRyPSR7TUNBU1RfSVBWNl9BRERSX1BSRUZJWH06JHtuX2hl
eH0KPiBuaXQ6IHdyb25nIGluZGVudApTdHJhbmdlIDspCj4KPj4gKwkJZWxzZQo+PiArCQkJbG9j
YWwgeD0kKChuIC8gMjU0KSkKPj4gKwkJCWxvY2FsIHk9JCgobiAlIDI1NCArIDEpKQo+PiArCQkJ
bG9jYWwgYWRkcj0ke01DQVNUX0lQVjRfQUREUl9QUkVGSVh9LiR7eH0uJHt5fQo+PiArCQlmaQo+
PiArCj4+ICsJCWxvY2FsIHBvcnQ9JCh0c3RfZ2V0X3VudXNlZF9wb3J0IGlwdiR7VFNUX0lQVkVS
fSBkZ3JhbSkKPj4gKwkJWyAkPyAtbmUgMCBdICYmIHRzdF9icmsgVEJST0sgIk5vIGZyZWUgdWRw
IHBvcnQgYXZhaWxhYmxlLiIKPiBuaXQ6IG5vIGRvdCBwbGVhc2UuCj4KPj4gKwkJdHN0X3JlcyBU
SU5GTyBQb3J0OiAkcG9ydAo+IFRoaXMgc2hvdWxkIGJlIHF1b3RlZC4KQ291bGQgYWxzbyBiZSBy
ZW1vdmVkLiBJIGd1ZXNzIHRoaXMgd2FzIGZvciB0ZXN0aW5nLi4uCj4KPj4gKwo+PiArCQkjIFJ1
biBhIHJlY2VpdmVyCj4+ICsJCVJPRCBucy1tY2FzdF9yZWNlaXZlciAtZiAkVFNUX0lQVkVSIC1J
ICQodHN0X2lmYWNlIGxob3N0KSAtbSAkYWRkciAtcCAkcG9ydCAtYgo+PiArCQo+PiArCQkjIFJ1
biBhIHNlbmRlcgo+PiArCQl0c3Rfcmhvc3RfcnVuIC1zIC1jICJucy11ZHBzZW5kZXIgLUQgJGFk
ZHIgLWYgJFRTVF9JUFZFUiAtcCAkcG9ydCAtbSAtSSAkKHRzdF9pZmFjZSByaG9zdCkgLWIgLXQg
JE5TX0RVUkFUSU9OIgo+PiArCj4+ICsJCTogJCgobiArPSAxKSkKPiBzdXJlIHRoaXMgd29ya3Ms
IGJ1dCBJJ2QgcHJlZmVyOgo+IG49JCgobiArPSAxKSkKSSBkb24ndCBjYXJlCj4+ICsJZG9uZQo+
IFRoZSByZXN0IExHVE0uCgpUaGFua3MKSsO2cmcKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
