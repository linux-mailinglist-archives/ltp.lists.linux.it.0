Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE02AC420
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 19:48:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 235BD3C5DC4
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 19:48:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CE4B23C2453
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 19:48:46 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3E8F26008C8
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 19:48:46 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9IhhfG074601;
 Mon, 9 Nov 2020 18:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=6E1OFiqJG25hnajgxsapdvv0tUMsbRWoVdpuOoRGPZQ=;
 b=OgAT2BS9TlIRIAY0iJ88XhTS/7byb0cAmOjzGMMZK0augGKuiabiEX4ZE/VlpVO/PEk9
 MY8tVx3csvB2fAqR8fjTNaNQNMQRkA7yo6qvzWfFEQZ9FUvzbjrlh64NKrFyVQzKnwtC
 mxBe/G8mFdZNipNjgEjdgjeNxL8xg44p7oRR/EZYZXapiYI6+ZdpWrDjBv0/QgF5T22H
 CPO+W8Q0U1rpGyB2bNx06+ts7MxGHETglMElryjD2KX9mwEATv3GBADonIrr5zY/LxtZ
 3b7tSBbyiB2XNb5t5e481L606JdZI338BrVMVPHyQHq7D68McPxhNPQFiF1IgcShkh/k XQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34nkhkqkmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 09 Nov 2020 18:48:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A9Ik59X082721;
 Mon, 9 Nov 2020 18:48:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 34p5gvn765-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Nov 2020 18:48:40 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A9ImaH9012395;
 Mon, 9 Nov 2020 18:48:38 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Nov 2020 10:48:36 -0800
To: =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>
References: <20201106143605.27230-1-kory.maincent@bootlin.com>
 <5de346c3-ccd6-743e-c83c-e16c592c7ac5@oracle.com>
 <20201109192753.70167ef1@kmaincent-XPS-13-7390>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <3dd5d20c-5dd9-7877-997b-731018e4d0ec@oracle.com>
Date: Mon, 9 Nov 2020 21:48:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109192753.70167ef1@kmaincent-XPS-13-7390>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090128
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMDkuMTEuMjAyMCAyMToyNywgS8O2cnkgTWFpbmNlbnQgd3JvdGU6Cj4+Cj4+ICRQSU5HIC1o
IDI+JjEgfCBncmVwIC1xICdbLV1mJyB8fCBwaW5nX29wdHM9Ii1pIDAuMDEgLXAgYWEiCj4gCj4g
VGhlIGdyZXAgaW4gcGFyYW1ldGVyIGlzIG5vdCB3b3JraW5nIGZvciBhbGwgY2FzZXMuCj4gRm9y
IGV4YW1wbGUgdGhlIHBpbmcgdXNhZ2Ugb2YgbXkgVWJ1bnR1IGxhcHRvcCBpczoKPiBVc2FnZTog
cGluZyBbLWFBYkJkRGZoTG5PcXJSVXZWNjRdIFstYyBjb3VudF0gWy1pIGludGVydmFsXSBbLUkg
aW50ZXJmYWNlXQo+ICAgICAgICAgICAgIFstbSBtYXJrXSBbLU0gcG10dWRpc2Nfb3B0aW9uXSBb
LWwgcHJlbG9hZF0gWy1wIHBhdHRlcm5dIFstUSB0b3NdCj4gICAgICAgICAgICAgWy1zIHBhY2tl
dHNpemVdIFstUyBzbmRidWZdIFstdCB0dGxdIFstVCB0aW1lc3RhbXBfb3B0aW9uXQo+ICAgICAg
ICAgICAgIFstdyBkZWFkbGluZV0gWy1XIHRpbWVvdXRdIFtob3AxIC4uLl0gZGVzdGluYXRpb24K
PiAKPiAKPiBJIG1heSB1c2UgdGVzdCBsaWtlIHRoaXM6Cj4gJFBJTkcgLWMgMSAtZiAkaXBhZGRy
ID4vZGV2L251bGwgMj4mMSB8fCBwaW5nX29wdHM9Ii1pIDAuMDEgLXAgYWEiCj4gCj4gV2hhdCBk
byB5b3UgdGhpbms/Cj4gCgpBZ3JlZSwgaW4gdGhhdCBjYXNlIGl0J3MgYmV0dGVyIHRvIHRyeSBw
aW5nIHdpdGggdGhlIG9wdGlvbi4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
