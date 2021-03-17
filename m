Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CFC33EAF1
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 08:58:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A84BE3C61EA
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 08:58:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 443A33C2D06
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 08:58:46 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B61DD200AE4
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 08:58:45 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.4.45])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B9CBB9F7F6;
 Wed, 17 Mar 2021 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615967923; bh=an8oCqCuKrT3hEbiwugfaRjp2vS7KYC+/PCgmZWxe3s=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=YX9aQkHUXNj8bg0zu6/yWfLnjV4jmk0OQQU0TLNF1DHkVVmEgvILx39IvFy79+gOB
 p3mgjUy/IZw/Rr6ohLnhk6+bumxx+jmwBFhF4XfQFlmdiC3sCakhbyE1tudHghoF6p
 LPtHTcuPTtYBAG0QOfdKzPjxdEYZTd17my4ri/G8=
To: Li Wang <liwang@redhat.com>
References: <20210316130036.1838169-1-lkml@jv-coder.de>
 <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
 <4e99e625-07f1-e0c1-ab23-30f0ee8e59ef@jv-coder.de>
 <CAEemH2ej++f-e17ifn2eFqaQJmECgei62nXR7LnD-X1ypQ3czQ@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <dbebbb6b-b2d1-c95a-3a8d-d92aae7a83f3@jv-coder.de>
Date: Wed, 17 Mar 2021 08:59:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2ej++f-e17ifn2eFqaQJmECgei62nXR7LnD-X1ypQ3czQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open_posix: Remove hardcoded /tmp
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgo+IEluIGZhY3QgdXNlbGVzcywgYW5kIG5vYm9keSBjYXJlcyBhYm91dCB0aGUgdGVt
cCBmaWxlwqBuYW1lLgo+IEJ1dCB0aGF0J2xsIG1ha2UgbmFtaW5nIG1ha2Ugc29tZSBzZW5zZSBv
ciB0aWR5LCBJTU8uCj4KPiAgICAgSSBqdXN0IGRlY2lkZWQgdG8ga2VlcCBpdCwgc28gZmlsZXMs
IHRoYXQgYXJlIG5vdCBkZWxldGVkCj4gICAgIGF1dG9tYXRpY2FsbHkKPiAgICAgY2FuIGJlIGlk
ZW50aWZpZWQgYXMgYmVsb25naW5nIHRvIHRoZSB0ZXN0Lgo+ICAgICBJZiBJIHdvdWxkIGltcGxl
bWVudCB0aGlzLCB0aGVuIG9ubHkgaW4gdGhlIG1hY3JvIGRlZmluaXRpb24uCj4KPgo+IElmIEkg
d2FzIHRoZSBhdXRob3IsIHByZWZlciB0byBkbyB0aGF0IGluIG1hY3JvIGRlZmluaXRpb24gdG9v
OikuCklmIGl0IG1ha2VzIHlvdSBoYXBweSwgSSB0aGluayB0aGlzIGNhbiBiZSBkb25lIHdoaWxl
IG1lcmdpbmcuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
