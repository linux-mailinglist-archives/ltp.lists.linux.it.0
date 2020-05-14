Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7681D35F9
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 18:06:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCB8A3C2350
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 18:06:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BE9AC3C1C81
 for <ltp@lists.linux.it>; Thu, 14 May 2020 18:06:02 +0200 (CEST)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 81094600941
 for <ltp@lists.linux.it>; Thu, 14 May 2020 18:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=FikZW
 8eUM3fYxaz0wMNTrtpZIlJ7DFmT3moOclc5Mo0=; b=S95ovEtgPpmv2nqhENrT7
 u2G8Xc3JSc07q0pywCA36LMJPTN+QN5lQ68pfvfhcKKhuM3ZvwRnYAYKA+hzUKR+
 rZWkWxLRlL+Xz4uE0aYdQQzbCloPvp4Nl4OG42ABdQt44MXIcsqZ5m7dnzBuP0Em
 ZHTPKFiFuLfoysQyRx9jY0=
Received: from [192.168.0.10] (unknown [223.64.161.177])
 by smtp13 (Coremail) with SMTP id EcCowAAHtBVmbL1epTx8CQ--.53942S2;
 Fri, 15 May 2020 00:05:58 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200512201416.8299-1-pvorel@suse.cz>
 <20200514144729.GA19276@dell5510>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <238e6613-dc03-5d7f-bb0b-baccfbe773f6@163.com>
Date: Fri, 15 May 2020 00:05:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200514144729.GA19276@dell5510>
Content-Language: en-US
X-CM-TRANSID: EcCowAAHtBVmbL1epTx8CQ--.53942S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW5Cr15Kw4UJFyxAFW7CFg_yoWxCFgE9F
 1DWrZ7ZF1DGFZxJwsrAF1FvrsrGF1xX3yxJr4rX3W3W34SqwsxArs5ZrZ3K3W0gFW7KFnI
 9F1UZas8Wr109jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8KQ6PUUUUU==
X-Originating-IP: [223.64.161.177]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0gYkXlUMWHKS7wAAsg
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] rpc: TCONF when tests aren't compiled +
 remove kill warning
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gNS8xNC8yMCAxMDo0NyBQTSwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSwKPgo+PiB3aXRoIHRo
aXMgaW1wbGVtZW50YXRpb24gKHN1Z2dlc3RlZCBieSBBbGV4ZXkpLCB3ZSBnZXQgVENPTkYgdHdp
Y2UuIEl0J3MKPj4gYSBiaXQgc3RyYW5nZSwgYnV0IEknbGwga2VlcCBpdCwgYmVjYXVzZSBJIGxp
a2UgdGhhdCByZXF1aXJlZCBiaW5hcnkgaXMKPj4gcHJpbnRlZDoKPj4gcnBjX3Rlc3QgMSBUQ09O
RjogJ3RpcnBjX3JwY2JfZ2V0YWRkcicgbm90IGZvdW5kCj4+IHJwY190ZXN0IDEgVENPTkY6IExU
UCBjb21waWxlZCB3aXRob3V0IFRJLVJQQyBzdXBwb3J0Pwo+IFBsZWFzZSBhbnkgY29tbWVudCBm
b3IgMnggVENPTkYuIEl0J3MgYSBiaXQgc3RyYW5nZSwgYnV0IGp1c3QgYSB0aW55IGRldGFpbC4K
PiBJJ2QgbGlrZSB0byBoYXZlIHRoaXMgZml4IGluIHRoZSByZWxlYXNlLgoKSGkgUGV0ciwKCldo
eSBkb24ndCB5b3UgdXNlIHRzdF9jbWRfYXZhaWxhYmxlPyBsaWtlIHRoaXM6Cgpmb3IgaSBpbiAk
Q0xJRU5UICRTRVJWRVI7IGRvCgogwqDCoMKgIHRzdF9jbWRfYXZhaWxhYmxlICRpIHx8IHRzdF9i
cmsgVENPTkYgIiRpIG5vdCBmb3VuZC7CoCBMVFAgY29tcGlsZWQgCndpdGhvdXQgVEktUlBDIHN1
cHBvcnQ/IgoKZG9uZQoKQmVzdCBSZWdhcmRzLAoKWGlhbyBZYW5nCgo+Cj4gS2luZCByZWdhcmRz
LAo+IFBldHIKPgo+CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
