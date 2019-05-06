Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 886D915084
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 17:42:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49A6D3EAEC1
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 17:42:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 40EE13EA2DD
 for <ltp@lists.linux.it>; Mon,  6 May 2019 17:42:40 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C9BB5603454
 for <ltp@lists.linux.it>; Mon,  6 May 2019 17:42:41 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46Fg0br133144;
 Mon, 6 May 2019 15:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=g4RfSiaC4RviBrFmPwRIqyPWOYaVvT5fihHHOnH/fE4=;
 b=fvIlvmXzAN1/Q18fmAW78jjKW7QsgCLgvkUjcH7/isFNgFUe9OrTh6zW6+Z5hGzSUyrU
 kC2Vpfo5+x3HimjDO9jXZ5VasChurWv8o/D0Y/tcTKOjkOS3sayPBm3/sIygzmBsF+V+
 CbM97eLhIxqK1Lqtsvx3yUtBzTjdOgft4iM1G+NlVaWPrhwvl6NfySSOf0yS0PnKXqLA
 q9gnAIXLbyiTe/IH4WAuw6HnT73xuC35zT5BgkzbHu82LUrAPEhf9yrbd/pOaGIqY0/l
 vsMYlkZ1euOyJE2piEZS4LZSaMMORuUtFrBjR0W4AWfF8GS2aRh9SOor71awyjRiZgcm Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2s94b5qfgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 15:42:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46FgQvv133932;
 Mon, 6 May 2019 15:42:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2s94b8yjwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 15:42:35 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x46FgZ1h000383;
 Mon, 6 May 2019 15:42:35 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 May 2019 08:42:34 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20190427053929.7372-1-pvorel@suse.cz>
 <5cff91e0-c566-27c3-95dd-39dd4e2b6d0e@oracle.com>
 <20190502114459.GA32460@dell5510>
 <0c7a3010-d7d6-1d83-0548-148adb55b2cc@oracle.com>
 <20190506153220.GA21222@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <25305d65-d8ab-f0fa-dd39-defc093d6823@oracle.com>
Date: Mon, 6 May 2019 18:42:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190506153220.GA21222@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060134
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060133
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/1] net/broken_ip: Rewrite into new API
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMDYuMDUuMjAxOSAxODozMiwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSBBbGV4ZXksCj4gCj4+
Pj4gQWNrZWQtYnk6IEFsZXhleSBLb2RhbmV2IDxhbGV4ZXkua29kYW5ldkBvcmFjbGUuY29tPgo+
Pj4gLi4uCj4+Pj4+ICtleHBvcnQgSUNNUFY0X0RBVEFfTUFYU0laRT0xNDcyCj4+Pj4+ICtleHBv
cnQgSUNNUFY2X0RBVEFfTUFYU0laRT0xNDUyCj4gCj4+Pj4gU2luY2UgdGhlc2UgdmFyaWFibGVz
IGFyZSBpbiB0aGUgbGlicmFyeSwgbWF5IGJlIGl0IHdvdWxkIGJlIGJldHRlciB0byB0dW5lCj4+
Pj4gdGhlbSBkZXBlbmRpbmcgb24gYW4gTVRVIG9mIHRoZSB0ZXN0cyBpbnRlcmZhY2VzPwo+Pj4g
R29vZCBpZGVhLiAxNDcyIGFuZCAxNDUyIGFyZSBiYXNlZCBvbiBNVFUgPSAxNTAwIChJUHY0OiAx
NTAwIC0gMjAgYnl0ZXMgZm9yIElQdjQgaGVhZGVyCj4+PiAtIDggYnl0ZXMgZm9yIElDTVAgaGVh
ZGVyOyBJUHY2OiAxNTAwIC0gNDAgYnl0ZXMgZm9yIElQdjYgaGVhZGVyIC0gOCBieXRlcyBmb3Ig
SUNNUCBoZWFkZXIpLAo+Pj4gd2hpY2ggbG9va3MgdG8gbWUgYXMgdGhlIGRlZmF1bHQgZm9yIG5l
dG5zIE5JQ3MgYW5kIGV0aGVybmV0IGFuZCB3aWZpIE5JQ3MsCj4+PiBidXQgd2Ugc2hvdWxkIGF2
b2lkIGZhaWx1cmVzIHdoZW4gZGlmZmVyZW50IE1UVSB1c2VkLgo+Pj4gSSBwcm9wb3NlIG1lcmdp
bmcgdGhpcyB2ZXJzaW9uIGFuZCBhZGQgTVRVIGRldGVjdGlvbiBzdXBwb3J0IGxhdGVyLgo+IAo+
IAo+PiBPSy4gUGVyaGFwcyB3ZSBzaG91bGQgcmVuYW1lIHRoZW0gdG8gaW5kaWNhdGUgdGhhdCB0
aGV5IHJlbGF0ZSB0byBucy1pY21wdl9zZW5kZXIsCj4+IGJlY2F1c2UgdGhlIG1heGltdW0gaWNt
cCBkYXRhIHNpemUgaXMgNjU1MzUgLSBoZWFkZXJzLCBub3QgdGhvc2UgdmFsdWVzLgo+IFRydWUu
IEhvdyBhYm91dCB0aGlzOgo+IAo+IGV4cG9ydCBOU19JQ01QVjRfU0VOREVSX0RBVEFfTUFYU0la
RT0xNDcyCj4gZXhwb3J0IE5TX0lDTVBWNl9TRU5ERVJfREFUQV9NQVhTSVpFPTE0NTIKPiAKCkFn
cmVlLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
