Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B22177533
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:21:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 014B93C66E5
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:21:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4A8913C66D4
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:21:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 767A160148C
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:21:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 88275AD4F
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 11:21:30 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: LTP List <ltp@lists.linux.it>
References: <20200221120850.15874-1-mdoucha@suse.cz>
 <20200303104737.GA42129@gacrux.arch.suse.de>
Autocrypt: addr=mdoucha@suse.cz; keydata=
 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
Message-ID: <70a19473-081d-95ec-9801-d9c65b2e237c@suse.cz>
Date: Tue, 3 Mar 2020 12:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200303104737.GA42129@gacrux.arch.suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for CVE 2017-10661
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

KFJlc2VuZGluZyBiZWNhdXNlIEkgZm9yZ290IHRvIENDIHRoZSBMVFAgbWFpbGluZyBsaXN0IGlu
IHRoZSBvcmlnaW5hbAptZXNzYWdlIHRvIFBldHIgVm9yZWwuKQoKT24gMy8zLzIwIDExOjQ3IEFN
LCBQZXRyIFZvcmVsIHdyb3RlOgo+PiAtTERMSUJTCQkJKz0gLWxwdGhyZWFkIC1scnQKPj4gK3Rp
bWVyZmRfc2V0dGltZTAyOglDRkxBR1MJKz0gLXB0aHJlYWQKPj4gK3RpbWVyZmRfc2V0dGltZTAy
OglMRExJQlMJKz0gLXB0aHJlYWQgLWxydAo+IEludGVyZXN0aW5nLCBJIHRob3VnaHQgLXB0aHJl
YWQgd291bGRuJ3QgYmUgbmVlZGVkIHRvIGJlIGluIExETElCUwo+IChlbm91Z2ggdG8gaGF2ZSBp
dCBpbiBDRkxBR1MpLCBidXQgb2xkIGRpc3Ryb3MgKENlbnRPUyA2IGluIG91ciB0cmF2aXM6IGdj
Ywo+IDQuNC43LCBnbGliYyAyLjEyKS4KCnB0aHJlYWRfY3JlYXRlKCkgbWFuIHBhZ2Ugc2F5ICJj
b21waWxlIEFORCBsaW5rIHdpdGggLXB0aHJlYWQiLiDigL5cXyjjg4MpXy/igL4KCj4+ICsJd2hp
bGUgKHRzdF9menN5bmNfcnVuX2EoJmZ6c3luY19wYWlyKSkgewo+PiArCQlURVNUKHB1bmNoX2Ns
b2NrKFRGRF9USU1FUl9BQlNUSU1FIHwgVEZEX1RJTUVSX0NBTkNFTF9PTl9TRVQpKTsKPj4gKwo+
PiArCQlpZiAoVFNUX1JFVCA9PSAtMSkKPj4gKwkJCXRzdF9yZXMoVEJST0sgfCBUVEVSUk5PLCBU
SU1FUkZEX0ZMQUdTICIgZmFpbGVkIik7Cj4gTm93IHRoaXMgbmVlZHMgdG8gYmUgdHN0X3JlcyhU
RkFJTCAocGVyc29uIHdobyBtZXJnZXMgdGhpcyB3aWxsIGRvKS4KPiAKPj4gKwo+PiArCQlpZiAo
VFNUX1JFVCAhPSAwKQo+PiArCQkJdHN0X3JlcyhUQlJPSyB8IFRURVJSTk8sICJJbnZhbGlkICIg
VElNRVJGRF9GTEFHUwo+PiArCQkJCSIgcmV0dXJuIHZhbHVlIik7Cj4gVGhlIHNhbWUgaGVyZS4K
Ck5vLCBib3RoIHNob3VsZCBiZSB0c3RfYnJrKCkuIFRoZXJlJ3Mgbm8gcG9pbnQgY29udGludWlu
ZyB0aGUgdGVzdCBpZgpzZXR0aW5nIHRoZSBDQU5DRUxfT05fU0VUIGZsYWcgZmFpbHMuIFNvcnJ5
IGFib3V0IHRoZSB0eXBvLCBJIG5lZWQgbW9yZQpjb2ZmZWUuCgotLSAKTWFydGluIERvdWNoYSAg
IG1kb3VjaGFAc3VzZS5jegpRQSBFbmdpbmVlciBmb3IgU29mdHdhcmUgTWFpbnRlbmFuY2UKU1VT
RSBMSU5VWCwgcy5yLm8uCkNPUlNPIElJYQpLcml6aWtvdmEgMTQ4LzM0CjE4NiAwMCBQcmFndWUg
OApDemVjaCBSZXB1YmxpYwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
