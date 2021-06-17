Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F383AA9DA
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 06:20:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A6FB3C71C3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 06:20:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9F663C5655
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 06:20:28 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 895321001164
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 06:20:27 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C93669F72D;
 Thu, 17 Jun 2021 04:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623903626; bh=XAWyH1IwDKxlVLoGGZKWabR8ZcvWEKT1P+p6udNDuPY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=VMZ8B//Ox+soN8y6fPljbr+zQNccTqUJPPYFDmVmmhirDhgS+kmgbHKvXv7XXFDx6
 sNdR+bALi7X6XCyxxgfbnVZlAKSpNFTgGL+VU+97FzZBMDc1OiAybQRqPakQn+ruki
 3XyuHAp0yZgq7CvXsvS4ueK9hvBIhZLxulrS60ws=
To: Petr Vorel <pvorel@suse.cz>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>
References: <20210616081856.3026223-1-lkml@jv-coder.de>
 <fb4b9d45-2cbb-5e5c-fefe-3ca429373a54@bell-sw.com> <YMoMfS+cFx4aau01@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <b092967d-2104-03d3-a95d-2042724ecca0@jv-coder.de>
Date: Thu, 17 Jun 2021 06:20:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMoMfS+cFx4aau01@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] ssh-stress: Convert to new api
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

SGkgUGV0ciwKCk9uIDYvMTYvMjAyMSA0OjM2IFBNLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIEpv
ZXJnLCBBbGV4ZXksCj4KPiAuLi4KPj4+ICAgY2xlYW51cCgpCj4+PiAgIHsKPj4+ICsJbG9jYWwg
cGlkcwo+Pj4gKwo+Pj4gICAJIyBTdG9wIHRoZSBzc2ggZGFlbW9uCj4+PiAtCXRlc3QgLXMgc3No
ZC5waWQgJiYga2lsbCAkKGNhdCBzc2hkLnBpZCkKPj4+IC0JcGtpbGwgJ25ldHN0cmVzcyQnCj4+
PiAtCXRzdF9ybWRpcgo+Pj4gLQlbICIkcnRtcGRpciIgXSAmJiB0c3Rfcmhvc3RfcnVuIC1jICJy
bSAtcmYgJHJ0bXBkaXIiCj4+PiAtCVRNUERJUj0KPj4+ICsJWyAtcyBzc2hkLnBpZCBdICYmIGtp
bGwgJChjYXQgc3NoZC5waWQpCj4+PiArCVsgLW4gIiRORVRTVFJFU1NfUElEIiBdICYmIGtpbGwg
LTIgJE5FVFNUUkVTU19QSUQgPi9kZXYvbnVsbCAyPiYxCj4+PiArCj4+PiArCXRzdF9yaG9zdF9y
dW4gLWMgImtpbGwgJFJIT1NUX1BJRFMiICA+L2Rldi9udWxsIDI+JjEKPiBBbmQgY2hlY2sgYWxz
byAkUkhPU1RfUElEUywgcmlnaHQ/Cj4gWyAtbiAiJFJIT1NUX1BJRFMiIF0gJiYgdHN0X3Job3N0
X3J1biAtYyAia2lsbCAkUkhPU1RfUElEUyIgPi9kZXYvbnVsbCAyPiYxClJpZ2h0Li4uIEJ1dCBh
Y3R1YWxseSBkb2Vzbid0IG1hdHRlci4gSnVzdCAia2lsbCIgZG9lcyBub3RoaW5nIgo+Cj4+PiAr
Cj4+PiArCSMgS2lsbCBhbGwgcmVtYWluaW5nIHNzaCBwcm9jZXNzZXMKPj4+ICsJdHN0X3Job3N0
X3J1biAtYyAicGtpbGwgLWYgJ15zc2ggJFJIT1NUX1NTSF9DT05GJyIKPj4gUGVyaGFwcyB3ZSBz
aG91bGQgY2hlY2sgdGhhdCAkUkhPU1RfU1NIX0NPTkYgaXMgc2V0IGJlZm9yZSBydW5uaW5nCj4+
IHBraWxsLgo+IFsgLW4gIiRSSE9TVF9TU0hfQ09ORiIgXSAmJiB0c3Rfcmhvc3RfcnVuIC1jICJw
a2lsbCAtZiAnXnNzaCAkUkhPU1RfU1NIX0NPTkYnIgpZZXMsIHRoaXMgc2hvdWxkIGJlIGRvbmUu
Li4KPgo+IE5vIG5lZWQgdG8gcmVwb3N0LCBJJ2xsIGZpeCBpdCBiZWZvcmUgbWVyZ2UuClRoYW5r
cwoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
