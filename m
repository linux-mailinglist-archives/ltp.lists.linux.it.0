Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2E10718B
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 12:41:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 052493C2266
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 12:41:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 327733C2241
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 12:40:58 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C85456007B6
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 12:40:57 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAMBdSdN153134;
 Fri, 22 Nov 2019 11:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=x28XOhlINsM50K9X2rTleefaCn7sM8h4JMXyq2czKh4=;
 b=H332WystcKAunJUgSHojsduP3LLF3sVsKM1Sr40CRZNjZSs/HO70dF7/9bQDbjZ2cX19
 FcrpDtjyhhHhsPj70/aqJvFmcUK5+kaMhZES6EcwBPzPE4s9FnXOlLSQI4aAykBrc/1Z
 BDyb6x21+lNwWyAMIA8XiZ3EH4Yo+ouLMz8ykXb2LeYWci9vJI5EeKApwFCuBzbrggXl
 tOHw8O3A9QSqSpUnKzJHpcnaBiok/bQ6D0buebNqHI4eK51jA/ZL5vAHJdxbxQDwPBNC
 i7itz0DGcncYdmdN3tYL7VKHfX4ettnVOZwDPc091et2AO0ixfZIhtfwkAyt5c+tpIQc Cg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2wa9rr20wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 11:40:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAMBcMvS144556;
 Fri, 22 Nov 2019 11:40:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2wec28rg8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 11:40:53 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAMBeqSB000347;
 Fri, 22 Nov 2019 11:40:52 GMT
Received: from [192.168.1.49] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 22 Nov 2019 03:40:52 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191118104238.15044-1-alexey.kodanev@oracle.com>
 <20191121174405.GA16389@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <43b42a21-aa98-fb52-9627-ba9e1826c74b@oracle.com>
Date: Fri, 22 Nov 2019 14:40:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191121174405.GA16389@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=793
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911220105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=840 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911220105
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib/tst_net.sh: use SO_BINDTODEVICE in
 tst_netload()
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

On 21.11.2019 20:44, Petr Vorel wrote:
> Hi Alexey,
> 
>> Since we have the information about the device, enable the
>> auto usage of the option, when starting netstress.
> 
>> It can be disabled with TST_NETLOAD_BINDTODEVICE=0 even if
>> '-D' option is passed to tst_netload().
> 
>> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> nit: I'd use empty string instead of zero.
> testcases/lib/tst_net.sh
> -export TST_NETLOAD_BINDTODEVICE="${TST_NETLOAD_BINDTODEVICE:-1}"
> +export TST_NETLOAD_BINDTODEVICE="${TST_NETLOAD_BINDTODEVICE-1}"
> 
> testcases/network/mpls/mpls_lib.sh
> -TST_NETLOAD_BINDTODEVICE=0
> +TST_NETLOAD_BINDTODEVICE=

Hi Petr,

Changed the patch as you suggested and applied. Thanks for review!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
