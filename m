Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C19336053C
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 11:05:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D3523C7048
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 11:05:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3BBDE3C1B10
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 11:05:23 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5935B60010D
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 11:05:22 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 454E49F650;
 Thu, 15 Apr 2021 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1618477520; bh=3shz/HJRUIpiCPoWj2+qhTzPFUL4p8m3nNsHWztyU90=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=mKAZMgoimtwAokE/aMyUiygEdw9GY40JwnlSX+uVgxHOpWV9FHcN3fDr1fVj+8hwe
 dNnBsNk8R+Gd3A8kTue4wgdNdNw2hZD3QZ32oQvipjZGX75o5Phfn6cPO8UaiQ1om7
 2HEshq17skmQzfPNBCR9PE+feP5+G4RL+l9MGq4E=
To: Petr Vorel <pvorel@suse.cz>
References: <20210315092844.991073-1-lkml@jv-coder.de>
 <20210315092844.991073-2-lkml@jv-coder.de> <YGIf3JSsFHn/gwKJ@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <8f7b161a-486a-edc2-11de-32d5d6fac825@jv-coder.de>
Date: Thu, 15 Apr 2021 11:06:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YGIf3JSsFHn/gwKJ@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] pec: Fix multiple event test
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

SGkgUGV0ciwKCkkgd2lsbCBzZW5kIGEgdjIsIGJ1dCB3YW50IHRvIGNvbW1lbnQgb24gc29tZSBv
ZiB5b3VyIHJlbWFya3MgZmlyc3Q6CgpPbiAzLzI5LzIwMjEgODo0MyBQTSwgUGV0ciBWb3JlbCB3
cm90ZToKPj4gKwl3aGlsZSByZWFkIC1yIGV4cDsgZG8KPj4gKwkJbG9jYWwgZm91bmQ9MAo+PiAr
CQlhY3RfbmV2ZW50cz0kKChhY3RfbmV2ZW50cyArIDEpKQo+PiArCQl3aGlsZSByZWFkIC1yIDwm
JHtmZF9hY3R9IGFjdDsgZG8KPiA8JiBpcyBhIGJhc2hpc20uIElzbid0IGl0IHVzaW5nIGp1c3Qg
c3RkaW4gZW5vdWdoPwpBY3R1YWxseSBubywgYW5kIEkgZG9uJ3QgZXZlbiB0aGluayB0aGlzIGlz
IGEgYmFzaGlzbS4gSSBndWVzcyBpdCBpcyBhIApidWcgaW4gdGhlIGNoZWNrYmFzaGlzbXMgc2Ny
aXB0Lgpbbl08Jm0gbWVhbnMgY29weSBmaWxlIGRlc2NyaXB0b3IgbSB0byBuIHdoZW4gZXhlY3V0
aW5nIHRoZSBjb21tYW5kLiBTZWUgClsxXS4KTXkgdGhlb3J5IG9mIGEgYnVnIGlzIGV2ZW4gbW9y
ZSBzdXBwb3J0ZWQgYnkgdGhlIGZhY3QsIHRoYXQgCmNoZWNrYmFzaGlzbXMgc3VnZ2VzdHMgdG8g
cmVwbGFjZQoiPCYkdmFyIiB3aXRoICI+d29yZCAyPiYxIi4gc28gIjwmJHZhciIgb2J2aW91c2x5
IHRyaWdnZXJlZCB0aGUgCiImPndvcmQiLXJ1bGUuCgpUaGlzIGlzIHJlcXVpcmVkIGhlcmUsIGJl
Y2F1c2UgJGZkX2FjdCBpcyBhIGZpbGUgaGFuZGxlIHRvIHRoZSBhY3R1YWwgCnJlY2VpdmVkIGV2
ZW50cywgdGhhdCBpcyBzdXBwb3NlZAp0byBiZSBpdGVyYXRlZCBvbmx5IG9uY2UsIHdoaWxlIHRo
ZSBleHBlY3RlZCBldmVudHMgYXJlIGl0ZXJhdGVkIG92ZXIgaW4gCnRoZSBvdXRlciBsb29wLgpU
aGlzIGNvbnN0cnVjdCBhbGxvd3MgImFjdHVhbCIgdG8gY29udGFpbiBtb3JlIGV2ZW50cywgdGhh
biBleHBlY3RlZC4gCkJ1dCBhbGwgZXhwZWN0ZWQgZXZlbnRzIG11c3QgYmUKaW4gdGhlIGNvcnJl
Y3Qgb3JkZXIgaW4gYWN0dWFsLgoKSW4gdjIgSSByZW9yZGVyZWQgdGhlIGNvZGUgYSBiaXQgKHdo
aWxlIHJlYWQuLi4uOyBkbyAuLi4uOyBkb25lIDwmJGZkKS4gClRoaXMgc3RpbGwgdHJpZ2dlcnMg
Y2hlY2tiYXNoaW1zLCBidXQKaXQgdGhpcyB3b3JrcyBhdCBsZWFzdCBpbiBiYXNoLCBhc2gsIGRh
c2gsIGFuZCBidXN5Ym94IHNoLgoKPiAJCXdoaWxlIHJlYWQgLXIgPCAkZmRfYWN0IGFjdDsgZG8K
Pj4gKwkJCWlmIFsgIiRleHAiID0gIiRhY3QiIF07IHRoZW4KPj4gKwkJCQlmb3VuZD0xCj4+ICsJ
CQkJYnJlYWsKPj4gKwkJCWZpCj4+ICsJCWRvbmUKPj4gKwkJaWYgWyAkZm91bmQgLW5lIDEgXTsg
dGhlbgo+PiArCQkJZmFpbGVkPTEKPj4gKwkJCXRzdF9yZXMgVEZBSUwgIkV2ZW50IHdhcyBub3Qg
ZGV0ZWN0ZWQgYnkgdGhlIGV2ZW50IGxpc3RlbmVyOiAkZXhwIgo+PiArCQkJYnJlYWsKPj4gKwkJ
ZmkKPj4gKwlkb25lIDxnZW5fJGV2ZW50LmxvZwo+PiArCj4+ICsJZXZhbCAiZXhlYyAke2ZkX2Fj
dH08Ji0iCj4+ICsKPj4gKwlpZiBbICRmYWlsZWQgLWVxIDAgXTsgdGhlbgo+PiArCQlpZiBbICRh
Y3RfbmV2ZW50cyAtbmUgJG51bV9ldmVudHMgXTsgdGhlbgo+PiArCQkJdHN0X3JlcyBUQlJPSyAi
RXhwZWN0ZWQgJG51bV9ldmVudHMsIGJ1dCAkYWN0X25ldmVudHMgZ2VuZXJhdGVkIgo+PiArCQll
bHNlCj4+ICsJCQl0c3RfcmVzIFRQQVNTICJBbGwgZXZlbnRzIGRldGVjdGVkIgo+PiArCQlmaQo+
PiAgIAllbHNlCj4+IC0JCXRzdF9yZXMgVEZBSUwgIiRldmVudCBub3QgZGV0ZWN0ZWQgYnkgbGlz
dGVuZXIiCj4+ICsJCWNhdCBsaXNfJGV2ZW50LmxvZwo+IFdoeSByZW1vdmluZyB0c3RfcmVzIFRG
QUlMPwo+IElmICJjYXQgbGlzXyRldmVudC5sb2ciIG5lZWRlZCwgd2h5IG5vdCBoYXZpbmcgaXQg
aW4gcHJldmlvdXMgY29tbWl0PwpJIG1vdmVkIHRoaXMgdXAgaW50byB0aGUgbG9vcCwgdG8gYmUg
YWJsZSB0byBvdXRwdXQgdGhlIGV4cGVjdGVkIGV2ZW50LCAKdGhhdCB3YXMgbm90IGRldGVjdGVk
LgpUaGUgb3V0cHV0IG9mIHRoZSBhY3R1YWwgZXZlbnRzIGlzIGZvciBkZWJ1Z2dpbmcuIEl0IGlz
IG5vdCBzdHJpY3RseSAKcmVxdWlyZWQsCmJ1dCBjb3VsZCBzaW1wbGlmeSBpZGVudGlmeWluZyB3
aHkgYW4gZXZlbnQgaXMgbWlzc2luZy4gRmVlbCBmcmVlIHRvIApyZW1vdmUgdGhpcyBpbiB2MiA7
KQoKSSBob3BlIEkgZml4ZWQgZXZlcnl0aGluZyBlbHNlLgoKSsO2cmcKClsxXSAKaHR0cHM6Ly9w
dWJzLm9wZW5ncm91cC5vcmcvb25saW5lcHVicy8wMDk2MDQ0OTkvdXRpbGl0aWVzL3hjdV9jaGFw
MDIuaHRtbCN0YWdfMDJfMDdfMDUKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
