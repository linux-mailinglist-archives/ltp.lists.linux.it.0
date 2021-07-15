Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF553C9ACA
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:45:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E7743C8626
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:45:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC5323C65E3
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:44:59 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 261E86019CE
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:44:58 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 2E4709F920;
 Thu, 15 Jul 2021 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626338696; bh=/+VaiRgn/2PxpKItptem4XtztFCR/1plt/PXJJ0Quyk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=GuqqdK7vOZOKHORoQESQP8Wh3bTZVwv6cJ0a2Xww/egi/cAk36ZLzCwzg0Cr/7Ta6
 EOqkAjexsQ1yiHp49OkpGCCyTSfdrkF3khf8PYqeEulhvV/5p85o/8I5mtiZ9cYm1S
 uKH4kaYxP0Rl4rS3mpKIudDeJ0UTEGflC88TkdzY=
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
References: <20210715050812.1950884-1-lkml@jv-coder.de>
 <60EFF034.6070800@fujitsu.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <4aaba9d9-e013-3c12-500a-647ff2c0b82d@jv-coder.de>
Date: Thu, 15 Jul 2021 10:44:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <60EFF034.6070800@fujitsu.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] squashfs: Add regression test for sanity check
 bug
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgoKT24gNy8xNS8yMDIxIDEwOjIxIEFNLCB4dXlhbmcyMDE4Lmp5QGZ1aml0c3UuY29tIHdy
b3RlOgo+Cj4+ICsJdHN0X2NtZChhcmd2LCAiL2Rldi9udWxsIiwgTlVMTCwgMCk7Cj4gV2UgaGF2
ZSBTQUZFX0NNRCBhcGkuClllcyBtYWtlcyBzZW5zZS4gVGhpcyBjYW4gYmUgcmVwbGFjZWQgZHVy
aW5nIG1lcmdlIEkgZ3Vlc3MuCi3CoMKgwqDCoMKgwqAgdHN0X2NtZChhcmd2LCAiL2Rldi9udWxs
IiwgTlVMTCwgMCk7CivCoMKgwqDCoMKgwqAgU0FGRV9DTUQoYXJndiwgIi9kZXYvbnVsbCIsIE5V
TEwpOwo+PiArc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+PiArCS50ZXN0X2FsbCA9
IHJ1biwKPj4gKwkuY2xlYW51cCA9IGNsZWFudXAsCj4+ICsJLnNldHVwID0gc2V0dXAsCj4+ICsJ
Lm5lZWRzX3Jvb3QgPSAxLAo+PiArCS5uZWVkc19kZXZpY2UgPSAxLAo+PiArCS5kZXZfbWluX3Np
emUgPSAxLAo+PiArCS5uZWVkc19jbWRzID0gKGNvbnN0IGNoYXIgKmNvbnN0IFtdKSB7Cj4+ICsJ
CSJta3NxdWFzaGZzIiwKPj4gKwkJTlVMTAo+PiArCX0sCj4+ICsJLm5lZWRzX2RyaXZlcnMgPSAo
Y29uc3QgY2hhciAqY29uc3QgW10pIHsKPj4gKwkJInNxdWFzaGZzIiwKPj4gKwkJTlVMTAo+PiAr
CX0sCj4+ICsJLnRhZ3MgPSAoY29uc3Qgc3RydWN0IHRzdF90YWdbXSkgewo+PiArCQl7ImxpbnV4
LWdpdCIsICJjMWIyMDI4MzE1YyJ9LAo+PiArCQl7ImxpbnV4LWdpdCIsICI4YjQ0Y2EyYjYzNCJ9
LAo+PiArCQl7fQo+PiArCX0sCj4+ICsJLm5lZWRzX3RtcGRpciA9IDEsCj4gbmVlZHNfZGV2aWNl
IGhhcyBlbmFibGVkIG5lZWRzX3RtcGRpciBpbiBpbnRlcm5hbCwgc28gd2UgZG9uJ3QgbmVlZCB0
bwo+IHNldCBpdCBoZXJlLgpIb25lc3RseSBJIGhhdGUgaW1wbGljaXRuZXNzIGxpa2UgdGhhdC4g
SSB0aGluayBpZiB0aGUgdGVzdCBpdHNlbGYgbmVlZHMgCnRoZSB0bXBkaXIsIGl0IHNob3VsZCBz
dGF0ZSBpdCBhbmQgbm90IHJlbHkgb24gc29tZSBvdGhlciAibmVlZHNfKiIgCnN0dWZmIHRvIGFs
c28gZW5hYmxlIGl0LgpCdXQgaWYgd2hvZXZlciBtZXJnZXMgdGhpcyBhZ3JlZXMgd2l0aCB5b3Us
IGhlIGNhbiBjaGFuZ2UgaXQuLi4KCkpvZXJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
