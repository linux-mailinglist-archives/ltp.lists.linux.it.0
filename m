Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A21D8EFA
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 07:05:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AE113C4E94
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 07:05:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 954D23C04F0
 for <ltp@lists.linux.it>; Tue, 19 May 2020 07:05:15 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EA7796023C9
 for <ltp@lists.linux.it>; Tue, 19 May 2020 07:05:12 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.1.13])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 508BDA32A5;
 Tue, 19 May 2020 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1589864708; bh=lZFQCMqBlOfn0FLkbyMcqnQ3S80+MOFba1jHG8iXcqY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=jBzpBMsR0jY2K3QQAOefFbR2mUl1LOafEfko9lJIkDhd2zgLeHpcikT5WQg6kY1Po
 zfXS6QaO07/t5sNGW728VzEgE61eRz5/pch79EFpZgS02qrAWXuebaqGZ5z2ErhMjY
 SfXSlBjYf+yUs4sAo0gPLNYcY/hWfvy3deqCHakE=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200518130132.19312-1-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <1a41aca6-f774-08da-bf7b-b33806b48923@jv-coder.de>
Date: Tue, 19 May 2020 07:05:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518130132.19312-1-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] tst_test.sh: Fix calling not yet loaded
 cleanup function
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

SGkgUGV0ciwKCj4gICAJVFNUX0RPX0VYSVQ9MQo+ICAgCj4gLQlpZiBbIC1uICIkVFNUX0NMRUFO
VVAiIC1hIC16ICIkVFNUX05PX0NMRUFOVVAiIF07IHRoZW4KPiArCWlmIFsgLW4gIiRUU1RfU0VU
VVBfU1RBUlRFRCIgLWEgLW4gIiRUU1RfUlVOX1NUQVJURUQiIC1hIFwKPiArCQktbiAiJFRTVF9D
TEVBTlVQIiAtYSAteiAiJFRTVF9OT19DTEVBTlVQIiBdOyB0aGVuCkluIHRoZSBkZXNjcmlwdGlv
biB5b3Ugd3JpdGUgIlthZnRlcl0gcnVubmluZyBlaXRoZXIgc2V0dXAgb3IgdGVzdCAKZnVuY3Rp
b24iLiBCdXQgdGhpcyBpbXBsZW1lbnRhdGlvbgppcyAiYWZ0ZXIgcnVubmluZyBzZXR1cCBhbmQg
dGVzdCBmdW5jdGlvbiIuIENsZWFudXAgc2hvdWxkIGFsc28gYmUgCmV4ZWN1dGVkLCBpZiBvbmx5
IHNldHVwIHdhcyBydW4gcmlnaHQ/Cj4gICAKPiBAQCAtNTkyLDkgKzU5NCwxMSBAQCB0c3RfcnVu
KCkKPiAgIAkJCV90c3RfbWF4PSQoKCAkKGVjaG8gJFRTVF9URVNUX0RBVEEgfCB0ciAtY2QgIiRU
U1RfVEVTVF9EQVRBX0lGUyIgfCB3YyAtYykgKzEpKQo+ICAgCQkJZm9yIF90c3RfaSBpbiAkKHNl
cSAkX3RzdF9tYXgpOyBkbwo+ICAgCQkJCV90c3RfZGF0YT0iJChlY2hvICIkVFNUX1RFU1RfREFU
QSIgfCBjdXQgLWQiJFRTVF9URVNUX0RBVEFfSUZTIiAtZiRfdHN0X2kpIgo+ICsJCQkJVFNUX1JV
Tl9TVEFSVEVEPTEKPiAgIAkJCQlfdHN0X3J1bl90ZXN0cyAiJF90c3RfZGF0YSIKPiAgIAkJCWRv
bmUKPiAgIAkJZWxzZQo+ICsJCQlUU1RfUlVOX1NUQVJURUQ9MQo+ICAgCQkJX3RzdF9ydW5fdGVz
dHMKPiAgIAkJZmkKSXMgaXQgcmVhbGx5IGltcG9ydGFudCwgdGhhdCB0ZXN0IGlzIHN0YXJ0ZWQ/
IFNob3VsZG4ndCBpdCBiZSBlbm91Z2ggaWYgCndlIGdvdCB0byB0aGUgcG9pbnQsIHdoZXJlIHRo
ZSB0ZXN0CmNvdWxkIGJlIHN0YXJ0ZWQuIE1vdmluZyBUU1RfUlVOX1NUQVJURUQgb3V0IG9mIHRo
ZSBjb25kaXRpb24gd291bGQgCnJlZHVjZSByZXBldGl0aW9uLgoKSsO2cmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
