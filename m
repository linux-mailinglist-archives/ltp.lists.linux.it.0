Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C73FAF09
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 11:55:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C046F3C2382
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 11:55:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EF3353C22A9
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 11:55:15 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0C33314088D9
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 11:55:14 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADAj61M068046;
 Wed, 13 Nov 2019 10:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=DZxti2DI7RKr6B/goOTWHuckfbB10nuDIsUn5CN3yGg=;
 b=LsUoxM49liqnKIFKNljp7xNwb02LfMVsqvKh1bHdt3zppoonPEw2bTFZgOmd1nzDCdqD
 08zOFAAQHvE/KUkK4FfU7QhqAap8P9OR/6ROZYSNMiM+pWt23YLvtQ6/OMIpFEGiSRLm
 4Ry8Y6YkpN37uD9x1RzYlBJJHPgpawYfSX44cSqUSBpdzp8cGD2eHQSKNUXY3nUr2G9v
 ij+J7RKKg0CivcHmVxbEtW7SF59rZ5dPsjdfR4A5kOel5T8tN7zHffNCvQQzAPndMe5G
 bHSjWboPW/2pIFhE13BQIK4821Z5un54Pmbpgmme4R+wxHiFnGN8HGsCu3Nkl1uNc6Ll QA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2w5p3queh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 10:55:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADAnTbO070298;
 Wed, 13 Nov 2019 10:55:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2w7vpp2tep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 10:55:08 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xADAt5GA024740;
 Wed, 13 Nov 2019 10:55:07 GMT
Received: from [192.168.1.49] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Nov 2019 02:55:05 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191112151131.5740-1-alexey.kodanev@oracle.com>
 <20191112151131.5740-2-alexey.kodanev@oracle.com>
 <20191113010201.GB21042@x230>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <8e948e74-fb5a-5e1b-ec52-28276d2b030f@oracle.com>
Date: Wed, 13 Nov 2019 13:55:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191113010201.GB21042@x230>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911130102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911130102
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] network/netstress: set default options value
 after arg parsing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13.11.2019 04:02, Petr Vorel wrote:
> Hi Alexey,
> 
>> It fixes misleading warnings about multiple options being set:
> 
>> $ netstress -H 127.0.0.1
>> tst_test.c:500: WARN: Option -H passed multiple times
>> tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
>> ...
> 
>> But for the result path 'rpath', don't create a file if the option
>> is not set.
> 
>> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
> 
> Good catch :).
> 

Thanks for review Petr, both patches applied.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
