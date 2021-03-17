Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8233ED97
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:56:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1A073C2D4E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:56:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 96E013C2CFC
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:56:30 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EB31F600567
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:56:29 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.4.45])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3B3BC9F7F6;
 Wed, 17 Mar 2021 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615974986; bh=OKqktqYKAdZnyaZizSHd3OUUsx+/QwLHLH5INbloyTg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=vPkF0R1zbjpG2WanOoMYrIxNlOxk/aMbe80u2w7bHYOp4jevl3mtNqoxjbPd9uzFU
 Pg4FkIU7+8CKGuJawlDQmMD2FrdZoa3VFUX4lw3pOgLu4+lbCQacc8WiLW7W7ixH6Q
 CfCDhx+NdE/ym1pQAvQcG8qEIXSrqgVVZWr+4GbY=
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
References: <20210316130036.1838169-1-lkml@jv-coder.de>
 <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
 <4e99e625-07f1-e0c1-ab23-30f0ee8e59ef@jv-coder.de>
 <CAEemH2ej++f-e17ifn2eFqaQJmECgei62nXR7LnD-X1ypQ3czQ@mail.gmail.com>
 <dbebbb6b-b2d1-c95a-3a8d-d92aae7a83f3@jv-coder.de>
 <CAEemH2e5xZvJQSYgBXqhgEpqYyQyM=VTb6sWBJr0REzBDVnr5A@mail.gmail.com>
 <YFHR13zKL9XZtdya@yuki.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <6a27ab32-9402-bf37-8828-05c2d5ff9c9e@jv-coder.de>
Date: Wed, 17 Mar 2021 10:57:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFHR13zKL9XZtdya@yuki.lan>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
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

SGksCgpPbiAzLzE3LzIwMjEgMTA6NTQgQU0sIEN5cmlsIEhydWJpcyB3cm90ZToKPgo+IENhbiB3
ZSBwbGVhc2UgZml4IHRoZSBtYWNybyBuYW1lPwo+Cj4gVGhlIG9wZW4gcG9zaXggdGVzdHN1aXRl
IHVzZXMgUFRTXyBwcmVmaXggaW5zdGVhZCBvZiBMVFBfLgpUaGVyZSBhcmUgYWxzbyBzb21lIExU
UF8tbWFjcm9zIGluIG9wZW4gcG9zaXggKGxpa2UgTFRQX0FUVFJJQlVURV9VTlVTRUQpLgpJIHdh
c24ndCBzdXJlIGlmIG1heWJlIGZ1bGwgYXNzaW1pbGF0aW9uIGlzIHRhcmdldGVkLiBUaGF0J3Mg
d2h5IEkgdXNlZCAKTFRQLXByZWZpeC4KPiBBbHNvIHRoZSB0ZW1wZmlsZS5oIGhlYWRlciBzaG91
bGQgaGF2ZSBHUEx2Mi1vci1sYXRlciBTUERYIGhlYWRlci4KU29ycnkgYWJvdXQgdGhhdC4uLgoK
SsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
