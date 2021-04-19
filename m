Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8154363C8E
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 09:33:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB9A63C6D6D
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 09:33:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E81B3C6D51
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 09:33:03 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6EA5560564A
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 09:33:03 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 732BB9FB86;
 Mon, 19 Apr 2021 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1618817581; bh=YPIMhjXdpBn0dZ8rvCz4wNrWDFuX6GhJd0YyfMol68g=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=GqT3i95AEYF8kwG54A4yPuJ0BJVFV1Uf0PsfG3DiZLFbiY6OEAbppgex1bw3u8AHW
 EMfiPZFDonwqdItorUFvV+EjdzLAHpLe9mlVDvVt6Dc+BmGHaJV5bckCj+nJcFZ+2Z
 tSnG9bran/27qi+shtX5hixZAhimtuI6HVPBN+9s=
To: Petr Vorel <pvorel@suse.cz>
References: <20210415090542.960158-1-lkml@jv-coder.de> <YHnLrGS1lXy5Awvk@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <1672a8d4-e278-801b-a2f6-babdc473f42e@jv-coder.de>
Date: Mon, 19 Apr 2021 09:34:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHnLrGS1lXy5Awvk@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] pec: Fix multiple event test
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

SGksCgpPbiA0LzE2LzIwMjEgNzozOCBQTSwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSBKb2VyZywK
Pgo+IC4uLgo+PiArIyBGaW5kIGEgZnJlZSBmaWxlIGhhbmRsZQo+PiArZnJlZV9mZCgpCj4+ICt7
Cj4+ICsJbG9jYWwgZmQKPj4gKwo+PiArCWZvciBmZCBpbiAkKHNlcSAyMDApOyBkbwo+PiArCQkj
IFNhcHduIGEgbmV3IHNoLCBiZWNhdXNlIHJlZGlyZWN0aW5nIHRvIGEgbm9uIGV4aXN0aW5nIGZp
bGUgaGFuZGxlCj4+ICsJCSMgd2lsbCB0cmlnZ2VyIGEgc3ludGF4IGVycm9yLgo+PiArCQkvYmlu
L3NoIC1jICI6IDI+L2Rldi9udWxsID4mJGZkIHx8IDogMj4vZGV2L251bGwgPCYkZmQiIDI+L2Rl
di9udWxsCj4gUHJvYmFibHkgYmV0dGVyIHRvIHVzZSBzaCAtYyAiLi4uIgpJIHVzZWTCoCAvYmlu
L3NoLCBiZWNhdXNlIHRoYXQgaXMgdGhlIHNhbWUgaW50ZXJwcmV0ZXIgc3BlY2lmaWVkIGluIHRo
ZSAKc2hlYmFuZy4gSnVzdCB1c2luZyBzaCBjb3VsZCB0aGVvcmV0aWNhbGx5IGZhaWwgb3Igc3Bh
d24gYSBkaWZmZXJlbnQgc2hlbGwuCk1heWJlICRTSEVMTCB3b3VsZCBiZSBiZXR0ZXIsIGJ1dCBJ
IGRvbid0IGtub3cgaG93IHdpZGVseSB0aGlzIGlzIApzdXBwb3J0ZWQuLi4KCj4KPj4gKwkJaWYg
WyAkPyAtZXEgMiBdOyB0aGVuCj4+ICsJCQllY2hvICRmZAo+PiArCQkJcmV0dXJuCj4+ICsJCWZp
Cj4+ICsJZG9uZQo+IG1heWJlIEkgZG8gc29tZXRoaW5nIHdyb25nLCBidXQgdGhpcyB2ZXJzaW9u
IGZhaWxzIGZvciBtZQo+IChhbmQgSSdtIHN0aWxsIHRlc3RpbmcgaXQgb25seSBvbiBiYXNoKToK
Pgo+IGNuX3BlYyAxIFRJTkZPOiB0aW1lb3V0IHBlciBydW4gaXMgMGggNW0gMHMKPiBjbl9wZWMg
MSBUSU5GTzogVGVzdCBwcm9jZXNzIGV2ZW50cyBjb25uZWN0b3IKPiBjbl9wZWMgMSBUSU5GTzog
VGVzdGluZyBmb3JrIGV2ZW50IChuZXZlbnRzPTEwKQo+IGNuX3BlYyAxIFRCUk9LOiBObyBmcmVl
IGZpbGVoYW5kbGUgZm91bmQKPgo+IEkgZ3Vlc3MgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIGZy
ZWVfZmQoKS4KCkRhbW4gc2hlbGxzLi4uIEkganVzdCByZWFsaXplZCAvYmluL3NoIG9uIG15IHN5
c3RlbSB3YXMgZGFzaCdzIHNoIAplbXVsYXRpb24gYW5kIGl0IGRvZXMgbm90IGVtdWxhdGUgc2gg
dGhlIHNhbWUgd2F5IGJhc2ggZG9lcy4uLgpUaGUgcmV0dXJuIHZhbHVlIGluIGJhc2ggaXMgMSwg
bm90IHR3by4uLiBDYW4geW91IHBsZWFzZSBjaGVjayB0aGUgcGF0Y2ggCndpdGggWyAkPyAtbmUg
MCBdPyBUaGF0IHNob3VsZCB3b3JrIGZvciBhbGwgc2hlbGxzLgoKSsO2cmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
