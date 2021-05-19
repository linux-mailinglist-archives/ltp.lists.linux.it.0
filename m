Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E564C388B9F
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:25:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AD183C4F72
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:25:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7FB8E3C304B
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:25:01 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6C7E16018CF
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:25:00 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3FE589F72D;
 Wed, 19 May 2021 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1621419898; bh=A7aftTd+uh7KYHOGZAL7P84PTyzlGo9hddb4sMbiYEU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=EbA30ynMCkcXk0OOTHbI9YVJxKX/fHA269YH6aJymaX8PQxDW38zlgsv5yqmUt8iP
 GerVyT1sdEFUiGXymiOR88QpiakSGU1b/mHS6iZ6nLDXN4dIySZZy5SQ8idd5GqmVd
 Gv9UZTy9FcXiowZcqxZqjlRWVfQih9J5R92igXDo=
To: Li Wang <liwang@redhat.com>
References: <20210519063109.224352-1-lkml@jv-coder.de>
 <CAEemH2fcuMtZgthknbsLKHdhqq7NrtB=nm6Oi9pvxG6MH0_jsQ@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <8555aa72-3288-c1a9-d6f1-3998c15d630e@jv-coder.de>
Date: Wed, 19 May 2021 12:26:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAEemH2fcuMtZgthknbsLKHdhqq7NrtB=nm6Oi9pvxG6MH0_jsQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] shell: Fix timeout process termination for zsh
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

SGkgTGksCgoKT24gNS8xOS8yMDIxIDEyOjE4IFBNLCBMaSBXYW5nIHdyb3RlOgo+Cj4gSSdtIHdv
bmRlcmluZyBpZiB0aGlzIGlzIHpzaCBmZWF0dXJlIG9yIGEgYnVnIG9uIGEgc3BlY2lmaWMgdmVy
c2lvbj8KPiBpZiB0aGUgbGF0dGVyLCB3ZSBwcm9iYWJseSBoYXZlIG5vIG5lZWQgdG8gZml4IGl0
IGluIExUUC4KPiBCdHcsIHdoaWNoIHpzaCB2ZXJzaW9uIGRvIHlvdSB1c2U/Cj4KPiBPZGQsIEkg
dHJpZWQgb24gbXkgbGFwdG9wKEZlZG9yYTM0KSB3aXRoIHpzaC01LjUuMS02LmVsOF8xLjIueDg2
XzY0LAo+IGJ1dCBjb3VsZCBOT1QgcmVwcm9kdWNlIGl0Lgo+Cj4gbXkgcmVwcm9kdWNlcjoKPiAt
LS0tLS0tLS0tLS0tLS0tLQo+Cj4gIyBjYXQgdGVzdC5zaAo+Cj4gZWNobyAicGlkIGlzICQkIiAj
IHNlbmQgVEVSTSB0byBwaWQgaW4gYW5vdGhlciB0ZXJtaW5hbAo+Cj4gc2xlZXAgMTAwICYKPiBz
bGVlcF9waWQ9JCEKPgo+IHRyYXAgImtpbGwgJHNsZWVwX3BpZDsgZXhpdDsiIFRFUk0KPgo+IHdh
aXQgJHNsZWVwX3BpZAo+IFsgJD8gLWVxIDE0MyBdICYmIGVjaG8gIkZBSUwiCj4KCkkgbWF5IGhh
dmUgc29tZXRoaW5nIHRvIGRvIHdpdGggc3Vic2hlbGxzIGFnYWluLi4uCkkganVzdCB0d2Vha2Vk
IHlvdXIgcmVwcm9kdWNlciwgdG8gYmUgYSBiaXQgbW9yZSBsaWtlIG91ciAicmVhbCAKc2NlbmFy
aW8iIGFuZCBjYW4gcmVwcm9kdWNlIGl0OgoKdGltZW91dCgpCnsKIMKgwqDCoCBzbGVlcCAxMDAg
JgogwqDCoMKgIHNsZWVwX3BpZD0kIQogwqDCoMKgIHRyYXAgImVjaG8gUmVjZWl2ZWQgVEVSTTsg
a2lsbCAkc2xlZXBfcGlkOyBleGl0OyIgVEVSTQogwqDCoMKgIHdhaXQgJHNsZWVwX3BpZAogwqDC
oMKgIFsgJD8gLWVxIDE0MyBdICYmIGVjaG8gIkZBSUwiCn0KCnRpbWVvdXQgJgpwaWQ9JCEKc2xl
ZXAgMQpraWxsICRwaWQKCgokIGJhc2ggdGVzdC5zaApSZWNlaXZlZCBURVJNCgokIHpzaCB0ZXN0
LnNoClJlY2VpdmVkIFRFUk0KRkFJTAoKSsO2cmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
