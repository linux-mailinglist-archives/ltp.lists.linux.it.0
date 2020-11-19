Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 210332B8C8A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 08:49:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D76D03C2F4A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 08:49:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C7AF83C2E66
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 08:49:13 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2C57E600946
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 08:49:12 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 8388BA07FE;
 Thu, 19 Nov 2020 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605772151; bh=y0i4ytCc2pq66l/r9IVCL45RzFmGxN6k4v/FlkDhKd0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=E0dBvsbLHRety+l7ym9b8BczgsP5S/EEZ3e73IweodknH9CTKi0urF/2zIeAsaYh0
 aWIhdma38UkXu67q2lTwZzHY+noctPsSTx4+NHyEIUHLTot6e0B0afzJu9IUbkEZpx
 nwQ2SJtKW5UXfJqBSlidy/2A6FahqylZ7OL3W0sw=
To: Alexey Kodanev <alexey.kodanev@oracle.com>, ltp@lists.linux.it
References: <20201117124320.783802-1-lkml@jv-coder.de>
 <057bc703-d3b6-5d8a-4831-609e332fdc36@oracle.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <98732a50-84e4-97b2-5124-757d91eba7a4@jv-coder.de>
Date: Thu, 19 Nov 2020 08:49:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <057bc703-d3b6-5d8a-4831-609e332fdc36@oracle.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/3] network/stress/multicast/packet-flood:
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxleGV5LAo+IFRoZSBmb2xsb3dpbmcgY29tbWFuZCBzaG91bGQgc3VwcG9ydCBib3RoIHVk
cC91ZHA2Ogo+Cj4gbG9jYWwgbWNhc3RfcG9ydD0kKHRzdF9nZXRfdW51c2VkX3BvcnQgaXB2JHtU
U1RfSVBWRVJ9IGRncmFtKQpBY3R1YWxseSBmaW5kX3BvcnRidW5kbGUgZG9lc24ndCBkaXN0aW5n
dWlzaCBiZXR3ZWVuIGlwdjYgYW5kIGlwdjQgd2hlbiAKbG9va2luZyBmb3IgYSB3aW5kb3cgb2Yg
ZnJlZSBwb3J0cywgc28gaXQgd29ya3MgZm9yIGJvdGggdmFyaWFudHMuIFRoZSAKb25seSB0aGlu
ZyB0aGF0IGNhbiBoYXBwZW4sIGlzIHRoYXQgaXQgZmluZHMgbm8gZnJlZSBwb3J0cyBhdCBhbGws
IGV2ZW4gCmlmIHRoZXJlIGFyZSBzb21lIGZyZWUgcG9ydHMsIGJ1dCB0aGF0IGlzIHByb2JhYmx5
IGhpZ2hseSB1bmxpa2VseS4KU3RpbGwgSSB3b3VsZCBzYXk6IExldCdzIGdldCByaWQgb2YgdGhp
cyBmdW5jdGlvbiBhbmQgcmVtb3ZlIHVzYWdlIGFzIHdlIApnbzogSSB3aWxsIGNoYW5nZSBpdCBh
bnl3YXksIGJlY2F1c2UgSSBkb24ndCBsaWtlIHRoaXMuCj4gVGhpcyBjaGVjayBjYW4gYmUgcmVw
bGFjZWQgd2l0aAo+Cj4gUk9EIG5zLW1jYXN0X3JlY2VpdmVyIC1mICRUU1RfSVBWRVIgLUkgJCh0
c3RfaWZhY2UgbGhvc3QpIC1tICRtY2FzdF9hZGRyIC1wICRtY2FzdF9wb3J0IC1iCkFDSwo+IFdo
YXQgaWYgd2Ugc3dhcCBzZW5kZXIgYW5kIHJlY2VpdmVyLCBpLmUuCj4KPiBsb2NhbCBuc19vcHRz
PSItZiAkVFNUX0lQVkVSIC1wICRtY2FzdF9wb3J0Igo+Cj4gdHN0X3Job3N0X3J1biAtcyAtYyAi
bnMtbWNhc3RfcmVjZWl2ZXIgJG5zX29wdHMgLUkgJCh0c3RfaWZhY2Ugcmhvc3QpIC1tICRtY2Fz
dF9hZGRyIC1iIgo+IEVYUEVDVF9QQVNTIG5zLXVkcHNlbmRlciAtRCAkbWNhc3RfYWRkciAkbnNf
b3B0cyAtcyAzMjc2NyAtbSAtSSAkKHRzdF9pZmFjZSkgLXQgJE5TX0RVUkFUSU9OCj4KPiBCeSBk
ZWZhdWx0LCBsdHAgaXMgdXNpbmcgbmV0d29yayBuYW1lc3BhY2UsIHNvIGl0J3MgcHJvYmFibHkg
YmV0dGVyCj4gdG8gcnVuIHRoZSBiYWNrZ3JvdW5kIHNlcnZpY2UgdGhlcmUuCkkgdGhpbmsgdGhl
ICJ0aGluZy11bmRlci10ZXN0IiBoZXJlIGlzIHRoZSByZWNlaXZlciwgbm90IHRoZSBzZW5kZXIu
IEkgCmRvbid0IHNlZSBhbnkgYmVuZWZpdCBzd2FwcGluZyB0aGlzLCBpdCB3aWxsIG9ubHkgbW92
ZSB0aGUgdGVzdCB0byB0aGUgCndyb25nIG1hY2hpbmUsIGlmIG5ldHdvcmsgbmFtZXNwYWNlcyBh
cmUgbm90IGluIHVzCj4KPj4gKwlkb25lCj4+ICsKPj4gKwlzbGVlcCAkTlNfRFVSQVRJT04KPgo+
IEl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIHNtYWxsIGxvb3AgaW5zdGVhZCBvZiBhIHNpbmds
ZSAnc2xlZXAnIGFuZAo+IHBlcmlvZGljYWxseSBjaGVjayB0aGF0IHRoZSBiYWNrZ3JvdW5kIHNl
bmRlcnMgYXJlIHJlYWxseSBydW5uaW5nLi4uCkkgYWxzbyBkb24ndCBub3JtYWxseSBsaWtlIHNs
ZWVwcywgYnV0wqAgYWN0dWFsbHkgdGhlIHdheSB0aGUgdGVzdCBpcyAKaW1wbGVtZW50ZWQgYXQg
dGhlIG1vbWVudCBpdCB3b3VsZCBtYWtlIGxpdHRsZSBzZW5zZSB0byBhZGQgYWxsIHRoZSAKY29t
cGxleGl0eSByZXF1aXJlZCwgdG8gY29sbGVjdCBwaWRzLCB0byBjaGVjayB0aGUgc2VuZGVycyBh
bmQgaW1wbGVtZW50IAphIHRpbWVvdXQgUmlnaHQgYWZ0ZXIgdGhlIGxhc3QgbnMtdWRwc2VuZGVy
IGlzIHN0YXJ0ZWQsIHRoYXQgcnVucyBmb3IgCk5TX0RVUkFUSU9OLCB0aGUgc2xlZXAgaXMgZXhl
Y3V0ZWQgZm9yIE5TX0RVUkFUSU9OLiBFdmVuIGlmIHRoZSBzbGVlcCAKZXhpdHMgYmVmb3JlIG5z
LXVkcHNlbmRlciwgaXQgZG9lc24ndCBtYXR0ZXIsIGJlY2F1c2UgaXQgaXMganVzdCBhIGJpdCAK
ZWFybGllciBhbmQgdGhlIHRlc3QgdGltZSBpcyBhY3R1YWxseSB2YXJpYWJsZS4gSSB3b3VsZG4n
dCBjaGFuZ2UgdGhpcyAKdG8gYmUgbW9yZSBjb21wbGV4LCBhbHRob3VnaCBJIHdvdWxkIGRlc2ln
biBpdCBkaWZmZXJlbnRseSwgaWYgSSB3b3VsZCAKaW1wbGVtZW50IHRoZSB0aGlzIGFzIGEgbmV3
IHRlc3QuCkFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIG5vdCBiYWNrZ3JvdW5kIHRoZSBsYXN0
IG5zLXVkcHNlbmRlciAKZXhlY3V0aW9uLCBidXQgdGhhdCBjb3VsZCBiZSBhIGJpdCBvYnNjdXJl
CgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
