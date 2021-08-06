Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A03E20ED
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 03:22:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F29853C7FBA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 03:22:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 017483C562F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 03:22:30 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 174EC1400540
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 03:22:24 +0200 (CEST)
X-QQ-mid: bizesmtp54t1628212939ty52wq17
Received: from [10.4.23.179] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 09:22:06 +0800 (CST)
X-QQ-SSF: 0040000000200010B000B00A0000000
X-QQ-FEAT: v+YdhY+J56tw1AxATYxo8OpuaIok0dtG2jmNmNHnMUMSuVqBMqgGw8rhOvlp/
 bt5xjutFwS1+vO4CiYxeHLNp1I0iaWeTQZ0PDKKRMh9FwidtJt+LPWhW9WCHDqX71zh1qbf
 tBOloXdFS6BixL5LxeTaMjsTwGNUM6fPERPmeuERIqPRlX5K2Hzu4N/J229lEngYtfD6F4U
 rxOCTnAdGqUUXYkNN11weJiJ1QRohWsq2380uvNcflUiqmgbdJ79J6GL9IpQfVsmD5cGH+e
 Vg+ty1eEpl9m0lwtBGSZGVLxR7tWXBKeiwCOeuxXOP+TFu
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210804060736.10234-1-sujiaxun@uniontech.com>
 <YQvRg1O7kakkm30M@yuki>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <7da55dc8-edd4-e392-b5b5-d2adce0cfaa2@uniontech.com>+56F90A5CBDF7C3AD
Date: Fri, 6 Aug 2021 09:22:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YQvRg1O7kakkm30M@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [1/6] syscalls/sysfs: Convert sysfs01 to the new
 API
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T2theSwgdGhhbmsgeW91IGZvciB5b3VyIG1ldGljdWxvdXMgZ3VpZGFuY2UsIEkgd2lsbCByZXZp
c2UgYW5kIHN1Ym1pdCAKaXQgYWdhaW4gYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbnMuCgrU
2iAyMDIxLzgvNSDPws7nNzo1NCwgQ3lyaWwgSHJ1YmlzINC0tcA6Cj4gSGkhCj4+ICsJCVRFU1Qo
dHN0X3N5c2NhbGwoX19OUl9zeXNmcywgMSwgInByb2MiKSk7Cj4+Cj4+ICAgCQkvKiBjaGVjayBy
ZXR1cm4gY29kZSAqLwo+PiAtCQlpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKPj4gLQkJCXRzdF9y
ZXNtKFRGQUlMLCAic3lzZnMoMikgRmFpbGVkIGZvciAiCj4+IC0JCQkJICJvcHRpb24gMSBhbmQg
c2V0IGVycm5vIHRvICVkIiwgVEVTVF9FUlJOTyk7Cj4+ICsJCWlmIChUU1RfUkVUID09IC0xKSB7
Cj4+ICsJCQl0c3RfcmVzKFRGQUlMLCAic3lzZnMoMikgRmFpbGVkIGZvciAiCj4+ICsJCQkJICJv
cHRpb24gMSBhbmQgc2V0IGVycm5vIHRvICVkIiwgVFNUX0VSUik7Cj4+ICAgCQl9IGVsc2Ugewo+
PiAtCQkJdHN0X3Jlc20oVFBBU1MsICJzeXNmcygyKSBQYXNzZWQgZm9yICIgIm9wdGlvbiAxIik7
Cj4+ICsJCQl0c3RfcmVzKFRQQVNTLCAic3lzZnMoMikgUGFzc2VkIGZvciAiICJvcHRpb24gMSIp
Owo+PiAgIAkJfQo+IAo+IFRoaXMgY291bGQgYmUganVzdDoKPiAKPiAJVFNUX0VYUF9QT1NTSVRJ
VkUodHN0X3N5c2NhbGwoX19OUl9zeXNmcywgMSwgInByb2MiKSwKPiAJICAgICAgICAgICAgICAg
ICAgInN5c2ZzKDEsICJwcm9jIikiKTsKPiAKCi0tIApLaW5kIHJlZ2FyZHMsCgpzdWppYXh1bgoK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
