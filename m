Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A7FD94
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 18:13:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2AE63EACA6
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 18:13:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A05E13EA09D
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 18:12:58 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AF0BA1400DE9
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 18:12:57 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UG9Cdg151611;
 Tue, 30 Apr 2019 16:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=yiTH1HVlFoNwQYZlxM14OiNiWi3B5EqOX5CmgokFK4U=;
 b=q0kuQv/x0xVqYRTUBwa5XxciGO0lKEstHdzQoipAfoIDYN7r5DmdG2E34vkRppSyMe1v
 hR/CS9NVMfjYPza0K/U7oUVHlMRwvLU9MXEEy0eRmMJU+SIvUEgzXGj2Y8wCZ5VKWNXM
 oVwyLbRebhNgAlmhQCrujdRHLXf4l+LbsqYZjWtkWozTKlP0IQvg7oy48EFf7Ar8hIfg
 zo0ehs3hkU8A3Do+9NOZJOgsyS0ItxW6LIEXAqJrgumagz9KLqJ44sLbRjhyeUImtPWX
 3dIaawwtwuKqLEsMx5bsl3FtasTl4rF/Dl9HQrywfmle2uoe8hJZM67/seClCcuSXI54 jQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2s5j5u29mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 16:12:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UGBacc020602;
 Tue, 30 Apr 2019 16:12:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2s4yy9mwn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 16:12:55 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3UGCstn008086;
 Tue, 30 Apr 2019 16:12:54 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Apr 2019 09:12:53 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190429072800.23067-1-pvorel@suse.cz>
 <20190429072800.23067-2-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <946495a7-4f75-4cca-163d-9447818bf1c3@oracle.com>
Date: Tue, 30 Apr 2019 19:12:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190429072800.23067-2-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=994
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300098
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300099
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] net/tracepath: Rewrite into new API
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

T24gMjkuMDQuMjAxOSAxMDoyOCwgUGV0ciBWb3JlbCB3cm90ZToKPiBlbmhhbmNlbWVudHM6Cj4g
KiBDaGVjayBmb3IgdHJhY2VwYXRoIC02IHdoZW4gdHJhY2VwYXRoNiBub3QgYXZhaWxhYmxlCj4g
ICB0cmFjZXBhdGg2IHdhcyByZW1vdmVkIGluIGlwdXRpbHMgczIwMTYxMTA1IGFuZCByZXBsYWNl
ZCBieSB0cmFjZXBhdGggLTYsCj4gICB0aGlzIHdheSBpdCdzIHBvcnRhYmxlIGZvciBib3RoIGFs
bCBpcHV0aWxzIHJlbGVhc2VzCj4gCj4gKiBQcmludCB0cmFjZXBhdGggdmVyc2lvbiBpZiAtViBp
cyBhdmFpbGFibGUgKGFkZGVkIGluIGlucHV0aWxzIHMyMDE5MDMyNCkKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiAtLS0KPiAgLi4uL25ldHdvcmsvdGNw
X2NtZHMvdHJhY2VwYXRoL3RyYWNlcGF0aDAxLnNoIHwgNjAgKysrKysrKysrLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgoKQWNr
ZWQtYnk6IEFsZXhleSBLb2RhbmV2IDxhbGV4ZXkua29kYW5ldkBvcmFjbGUuY29tPgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
