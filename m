Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3792B2038
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:25:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF6613C5FD8
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:24:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 86D963C4FBC
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:24:55 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E05A41A0174E
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:24:54 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADGK1SS139659;
 Fri, 13 Nov 2020 16:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=eZoeU6Mlk6cMW3vBKO8rPsrxnyc2CzAyzE5AOpRRETo=;
 b=qKQ9KN4Kz1Fxu8xX11tUou3bm1MEhAtKceYvp8izJfiCMKQGy+pfdHSsT13eo+RBhK5W
 y9mlX+rYjEoSzM+tTjQan029W+nKmqWw8rnx4IhDs3rMA8n+uJRTvUDKXljIfVv4ox17
 mQUfIS5cdKp7u9hm509dFBzML/qaEou+ty/hgo1GOku6wMLn6zisj02Q9iVB2jqpQJf5
 oVWNudoYMNdevCq6Gz+PRAKplzr8scVEjRLnuGIYle5AVYzgJPkFflRtat8Cm/4VVHh4
 dkZ2wP6OC/oEOAQNyZjz4HnrbJwezMWVPZDHjjdmLN1++dM76bfh2/Iu+ZFITrujV7iA 9w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 34nh3bbcrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Nov 2020 16:24:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADGLFLC005139;
 Fri, 13 Nov 2020 16:22:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 34rt5855qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 16:22:46 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0ADGMgRg005602;
 Fri, 13 Nov 2020 16:22:43 GMT
Received: from [192.168.1.39] (/91.233.44.185)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Nov 2020 08:22:42 -0800
To: =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>,
 ltp@lists.linux.it
References: <20201113161739.37034d68@kmaincent-XPS-13-7390>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <509d120d-35b5-d435-c052-4d34314dd438@oracle.com>
Date: Fri, 13 Nov 2020 19:22:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113161739.37034d68@kmaincent-XPS-13-7390>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130105
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Need support on host01 test command.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTMuMTEuMjAyMCAxODoxNywgS8O2cnkgTWFpbmNlbnQgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
SSBhbSB0cnlpbmcgdG8gdXBkYXRlIGhvc3QwMSB0ZXN0IHRvIHRoZSBuZXcgQVBJLCBidXQgSSBn
b3Qgc29tZSBwcm9ibGVtIHdpdGgKPiB0aGF0IHRhc2suCj4gCj4gSSBhbSBub3QgYSBuZXR3b3Jr
IGV4cGVydCBhbmQgSSBhbSB3b25kZXJpbmcgd2h5IEkgZ290IHRoaXMgaXNzdWU6Cj4gIyBob3N0
ICQoaG9zdG5hbWUpCj4gOzsgY29ubmVjdGlvbiB0aW1lZCBvdXQ7IG5vIHNlcnZlcnMgY291bGQg
YmUgcmVhY2hlZAo+ICMgaG9zdCBsb2NhbGNob3N0Cj4gOzsgY29ubmVjdGlvbiB0aW1lZCBvdXQ7
IG5vIHNlcnZlcnMgY291bGQgYmUgcmVhY2hlZAo+IAo+IAo+IEkgYW0gd29ya2luZyBvbiBhbiBl
bWJlZGRlZCBib2FyZCB3aXRoIGFuIE9wZW5FbWJlZGRlZCBiYXNlZCBkaXN0cmlidXRpb24uCj4g
SSBtYXkgbWlzcyBzb21lIG5ldHdvcmsgcGFja2FnZSwgY291bGQgeW91IGdpdmUgbWUgYSBoaW50
IHRvIGdvIGZ1cnRoZXIuCj4gCgpIaSBLb3J5LAoKRWl0aGVyIHlvdSBkb24ndCBoYXZlIC9ldGMv
cmVzb2x2LmNvbmYgb3IgaXQgaXMgZW1wdHkuCgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
