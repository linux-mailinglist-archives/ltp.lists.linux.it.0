Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A045B96
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 13:43:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F37813EA6DE
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 13:43:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A88303EA594
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 13:43:17 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C69BE1402017
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 13:43:16 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5EBXqje183379;
 Fri, 14 Jun 2019 11:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=E/1UDb7IYzNd4rAYOhNexnuTx+mBfv7g7AKzWPkqfmM=;
 b=Zhh92Y/KJs813H/JBzoOK5FrdUtlopRcsHg9jzOfRxPbYBewMBnsT9cL8MFhkjpHIN7T
 Dc8qARW8qLslG2pWVW5HcBL7xTqvB0dqQcL3AtPq8K2Yz1VWZh+lirJtOh+5ayuUQi2o
 naH8JH9HqzRVoC4/tejyFSFWJMVR7LD++VyTB7QqyN/X4myWwmDw5XGg3+Q/xyJ4GE5b
 GHhjcEPjuBpa//doQpYKmss+bm8vXzgSIGjou4qzjjl9Lt+WZ3dvx7uG3X5Ez4VcTYQa
 HpxtCiLxgROFvgrUt1yHH1Nlbnh0nfkM9OILW7SbtJqx9cs4pZt8Y9uMj8KTp8CSXBF/ IQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t04eu726j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 11:43:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5EBhBv7136086;
 Fri, 14 Jun 2019 11:43:11 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t04j10ng9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 11:43:11 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5EBh7IV024668;
 Fri, 14 Jun 2019 11:43:09 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 Jun 2019 04:43:07 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20190510183132.31039-1-pvorel@suse.cz>
 <187fa31b-3295-6f1f-e330-1373b2fb4c66@oracle.com>
 <20190603072605.GB14710@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <925eb48b-cb17-a06e-175d-315716852c76@oracle.com>
Date: Fri, 14 Jun 2019 14:43:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190603072605.GB14710@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906140099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906140098
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH v2 0/6] net/route: Rewrite route{4,
 6}-change-{dst, gw} into C
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

SGkgUGV0ciwKT24gMDMuMDYuMjAxOSAxMDoyNiwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSBBbGV4
ZXksCj4gCj4gdGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBJIHN1cHBvc2UgeW91IGRvbid0IHNl
ZSBtdWNoIHBvaW50IG9mIHJld3JpdGluZyB0ZXN0cwo+IGludG8gQyAoYW5kIGRlcGVuZGluZyBv
biBsaWJtbmwpLiBUaGUgb3JpZ2luYWwgaWRlYSB3YXMgdG8gY2hhbmdlIGl0IGZhc3QgZW5vdWdo
Cj4gd2l0aCBDIHRvIHJlYWxseSBzdHJlc3MgaXQuIE9LLCBsZXQncyBsZWF2ZSBpdCA6KS4KPiAK
ClNvcnJ5IGZvciB0aGUgZGVsYXksIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhIHNoZWxsIHZh
cmlhbnQgd2l0aCB0aGUgcGluZyAoc28gd2UKY2FuIHZlcmlmeSB0aGUgcm91dGUpIGFuZCBhbHNv
IGtlZXAgdGhlIGxpYm1ubCB0ZXN0LWNhc2UgdG8gc3RyZXNzIHRoZSBjcmVhdGlvbi9kZWxldGlv
bi4KCj4+PiBkb190ZXN0KCkKPj4+IHsKPj4+IAlsb2NhbCBpZmFjZT0kKHRzdF9pZmFjZSkKPj4+
IAlsb2NhbCBhZGRyIG5ld19ydAo+IAo+Pj4gCW5ld19ydD0iJCh0c3RfaXBhZGRyX3VuICQxKS8k
bWFzayIKPj4+IAlhZGRyPSIkKHRzdF9pcGFkZHJfdW4gJDEgMSkiCj4gCj4+PiAJdHN0X3JlcyBU
SU5GTyAidGVzdGluZyByb3V0ZSAnJG5ld19ydCciCj4gCj4+PiAJdHN0X3Job3N0X3J1biAtcyAt
YyAiaXAgYWRkciBhZGQgJGFkZHIvJG1hc2sgZGV2ICQodHN0X2lmYWNlIHJob3N0KSIKPj4+IAlS
T0QgaXAgcm91dGUgYWRkICRuZXdfcnQgZGV2ICRpZmFjZQo+Pj4gCVJPRCBpcCBuZWlnaCByZXBs
YWNlICRhZGRyIGxsYWRkciAkKHRzdF9od2FkZHIgcmhvc3QpIG51ZCBwZXJtYW5lbnQgZGV2ICRp
ZmFjZQo+Pj4+IAlFWFBFQ1RfUEFTUyBucy11ZHBzZW5kZXIgLWYgJFRTVF9JUFZFUiAtRCAkYWRk
ciAtcCAkMSAtbyAtcyAkdWRwX3NpemUKPiAKPj4+IAlST0QgaXAgbmVpZ2ggZGVsICRhZGRyIGxs
YWRkciAkKHRzdF9od2FkZHIgcmhvc3QpIGRldiAkaWZhY2UKPj4+IAlST0QgaXAgcm91dGUgZGVs
ICRuZXdfcnQgZGV2ICRpZmFjZQo+Pj4gCXRzdF9yaG9zdF9ydW4gLWMgImlwIGFkZHIgZGVsICRh
ZGRyLyRtYXNrIGRldiAkKHRzdF9pZmFjZSByaG9zdCkiCj4gCj4+IFdpdGggbnMtdWRwc2VuZGVy
LCBJIHRoaW5rIGl0IGNhbiBiZSB3aXRob3V0IHNldHRpbmcgaXAgYWRkcmVzc2VzOgo+IFJvdXRl
IG92ZXIgZ2F0ZXdheSByZXF1aXJlcyAob24gSVB2NikgZ2F0ZXdheSBvbiByaG9zdCwgd2hpY2gg
aXMgcmVxdWlyZXMgdG8KPiBjcmVhdGUgdGhpcyBJUCBhZGRyZXNzIGZpcnN0Lgo+IAo+PiAgCVJP
RCBpcCByb3V0ZSBhZGQgJG5ld19ydCBkZXYgJGlmYWNlCj4+ICAJUk9EIGlwIG5laWdoIHJlcGxh
Y2UgJGFkZHIgbGxhZGRyICQodHN0X2h3YWRkciByaG9zdCkgbnVkIHBlcm1hbmVudCBkZXYgJGlm
YWNlCj4+ICAJRVhQRUNUX1BBU1MgbnMtdWRwc2VuZGVyIC1mICRUU1RfSVBWRVIgLUQgJGFkZHIg
LXAgJDEgLW8gLXMgJHVkcF9zaXplPiAKPj4gCVJPRCBpcCBuZWlnaCBkZWwgJGFkZHIgbGxhZGRy
ICQodHN0X2h3YWRkciByaG9zdCkgZGV2ICRpZmFjZQo+PiAgCVJPRCBpcCByb3V0ZSBkZWwgJG5l
d19ydCBkZXYgJGlmYWNlCj4gCj4+IEJ1dCB3aXRoIHBpbmcgYW5kIG5laWdoYm9yIGRpc2NvdmVy
eToKPj4gIAl0c3Rfcmhvc3RfcnVuIC1zIC1jICJpcCBhZGRyIGFkZCAkYWRkci8kbWFzayBkZXYg
JCh0c3RfaWZhY2Ugcmhvc3QpIgo+PiAgCVJPRCBpcCByb3V0ZSBhZGQgJG5ld19ydCBkZXYgJGlm
YWNlCj4+ICAJRVhQRUNUX1BBU1MgcGluZyRUU1RfSVBWRVIgLi4uCj4+ICAJUk9EIGlwIHJvdXRl
IGRlbCAkbmV3X3J0IGRldiAkaWZhY2UKPj4gIAl0c3Rfcmhvc3RfcnVuIC1jICJpcCBhZGRyIGRl
bCAkYWRkci8kbWFzayBkZXYgJCh0c3RfaWZhY2Ugcmhvc3QpIgo+IEkgcHJlZmVyIHVzaW5nIHBp
bmcgYW5kIG5laWdoYm9yIGRpc2NvdmVyeS4gSSBzdXBwb3NlIHRoZXNlIGFyZSBib3RoIGVxdWl2
YWxlbnQKPiAoaWYgbm90IGl0J2QgYmUgZ29vZCB0byBydW4gdGhlbSBib3RoKS4KPiAKPiBLaW5k
IHJlZ2FyZHMsCj4gUGV0cgo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
