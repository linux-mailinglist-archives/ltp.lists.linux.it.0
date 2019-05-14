Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E871C1C9
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 07:25:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB04E294AC4
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 07:25:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CE576294AA6
 for <ltp@lists.linux.it>; Tue, 14 May 2019 07:25:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 072112010AE
 for <ltp@lists.linux.it>; Tue, 14 May 2019 07:24:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,467,1549900800"; d="scan'208";a="62920857"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 May 2019 13:24:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id EBDDD4CDFAD4;
 Tue, 14 May 2019 13:24:54 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 14 May 2019 13:24:57 +0800
Message-ID: <5CDA5124.3070708@cn.fujitsu.com>
Date: Tue, 14 May 2019 13:24:52 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <1557732392-7049-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190513131451.GA22761@dell5510>
In-Reply-To: <20190513131451.GA22761@dell5510>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: EBDDD4CDFAD4.A231C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ltp-cap.m4: add libcap version detection && fix
 compiler error
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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

b24gMjAxOS8wNS8xMyAyMToxNCwgUGV0ciBWb3JlbCB3cm90ZToKCj4gSGkgWWFuZywKPgo+Cj4+
IEN1cnJlbnQgbHRwLWNhcC5tNCBkZWZpbmVzIGNhcF9saWJzIHdoZW4gbGliY2FwIGhhcwo+PiBj
YXBfY29tcGFyZSBmdW5jdGlvbi4gIFRoaXMgZnVuY3Rpb24gd2FzIGludHJvZHVjZWQgYnkKPj4g
bGliY2FwLTIuIEl0IGlzIG9ubHkgdXNlZCBmb3IgdGhlIHR3byBwbGFjZXMsIGFuZCBhbm90aGVy
Cj4+IHBsYWNlcyB3b3JrIGZpbmVzIHdpdGggbGliY2FwLTEuIFNvIGFkZCBsaWJjYXAgdmVyc2lv
bgo+PiBkZXRlY3Rpb24uCj4gQ2FuJ3Qgd2UganVzdCBmaXggdGhlc2UgcG9zc2libGUgY29tcGls
ZXIgZXJyb3JzIGZvciBvbGQgZGlzdHJvcyBhbmQgcmVxdWlyZQo+IGxpYmNhcCB2Mj8gIFRDT05G
IGZvciB2ZXJ5IG9sZCBkaXN0cm9zIGxvb2tzIE9LIGZvciBtZS4KPiBsaWJjYXAtMi4wMCB3YXMg
cmVsZWFzZWQgMTIgeWVhcnMgYWdvICgyMDA3KSwgdGhlc2UgZGlzdHJvcyBkb2VzIG5vdCBoYXZl
IGl0Ogo+IFNMRVMgMTAgU1AzIFsxXSwgUkhFTC00LjggWzJdLCBEZWJpYW4gNC4wIFszXS4gRG8g
d2UgcmVhbGx5IHdhbnQgdG8gY2FyZSBhYm91dAo+IHRoZXNlIG9sZCBkaXN0cm9zIChpdCBsb29r
cyBsaWtlIG9ubHkgUkhFTCBpcyBzdXBwb3J0ZWQpPwo+IFdlIGFsc28gZHJvcHBlZCBsaWJudW1h
IHYxIHN1cHBvcnQgKGluIDJjOThjYmJhZiksIHYyIHdhcyByZWxlYXNlZCBhdCBzaW1pbGFyCj4g
ZGF0ZSAoMjAwOCkuCkhpIFBldGVyCgogICBJIHNlbnQgYSBtYWlsIHRvIHlvdSBsYXN0IEZyaWRh
eSBtZW50aW9uZWQgdGhpcyBwcm9ibGVtLiBBdCB0aGUgYmVnaW5uaW5nLCBJCiAgIHRoaW5rIGl0
IG1ha2VzIG5vIHNlbnNlIGJlY2F1c2UgbGliY2FwLTEgaXMgdG9vIG9sZC4gIEJ1dCBJIG5vdGlj
ZXMgdGhhdCBsdHAtcXVvdGEubTQKICAgaGFzIHF1b3RhX3YxIGFuZCBxdW90YV92Mi4gSSBjaGFu
Z2VzIG15IG1pbmQuCgogICBTaW5jZSB3ZSBoYXZlIGRyb3AgbGlibnVtYSB2MSwgSSBhZ3JlZSB3
aXRoIHlvdSB0aGF0IHdlIGFsc28gZHJvcCBsaWJjYXAgdjEodG9vIG9sZCkuCiAgIEFsc28sIEkg
dGhpbmsgd2Ugc2hvdWxkIGRyb3AgcXVvdGFfdjEgYmVjYXVzZSBpdCBpcyB0b28gb2xkIChzaW5j
ZSBMaW51eCAyLjQuMjIsIFFfR0VUSU5GTyBoYXMKICAgYmVlbiBzdXBwb3J0ZWQgaW4ga2VybmVs
KS4KCktpbmQgUmVnYXJkcywKWWFuZyBYdQoKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4gWzFd
IGh0dHBzOi8vZGlzdHJvd2F0Y2guY29tL3RhYmxlLnBocD9kaXN0cmlidXRpb249c2xlJnBrZ2xp
c3Q9dHJ1ZSZ2ZXJzaW9uPTEwLXNwMyNwa2dsaXN0Cj4gWzJdIGh0dHBzOi8vZGlzdHJvd2F0Y2gu
Y29tL3RhYmxlLnBocD9kaXN0cmlidXRpb249cmVkaGF0JnBrZ2xpc3Q9dHJ1ZSZ2ZXJzaW9uPXJo
ZWwtNC44I3BrZ2xpc3QKPiBbM10gaHR0cHM6Ly9kaXN0cm93YXRjaC5jb20vdGFibGUucGhwP2Rp
c3RyaWJ1dGlvbj1kZWJpYW4mcGtnbGlzdD10cnVlJnZlcnNpb249NC4wI3BrZ2xpc3QKPgo+CgoK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
