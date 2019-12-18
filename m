Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC741249EA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 15:42:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 982DE3C22C8
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 15:42:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DE4023C0039
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 15:42:36 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DBF6D600131
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 15:42:35 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIEd0Wb058301;
 Wed, 18 Dec 2019 14:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=TQBxceOSqQ33qtgSjx+DqEuerxVvfbjd1Fqol4pEQxU=;
 b=V45BzDBN65pHDj05OXhhnzekfR0lGmjwXcZjqpdCcHcMhi59tr9+Z6WCMOckF0Rnr8if
 jd8PWq019oZQoJ256oDRadudAv2uBkGT7wR58KKYH0nZjY+HNjyCwifKTIoOI/9NaIPw
 BhLGe0FEGRX0HYY69tjeftG7yAe/xUKV6QTMjkuHuETmB3LX2KHLkencu5hRJxh9PJAi
 kNXvX/HvD6iWcFQR7tNV/azZpo+5O6UgwjVJFFl7inG039va5T8H+pDtMfa8brJN2YSM
 ExtRACmfiQ9lwFbBp9tam8prALgApoABf9aaJ7TjJYjoAT/hhVfAf6cidyGYpTmESPAy dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2wvrcrdxd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 14:42:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIEdAiN140131;
 Wed, 18 Dec 2019 14:42:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2wyedp4uhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 14:42:31 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBIEgS63003346;
 Wed, 18 Dec 2019 14:42:31 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Dec 2019 06:42:28 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191217171918.10237-1-alexey.kodanev@oracle.com>
 <20191217171918.10237-2-alexey.kodanev@oracle.com>
 <20191218084406.GA10966@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <f0aad696-82a5-fb06-0517-a437d95ae2e7@oracle.com>
Date: Wed, 18 Dec 2019 17:46:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218084406.GA10966@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912180122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912180122
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] network/iptables: add new test for
 iptables-tranlsate and nft
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

On 18.12.2019 11:44, Petr Vorel wrote:
> Hi Alexey,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> one more fix below.
> 
...
>> +. iptables_lib.sh
>> +. tst_test.sh
>> +
>> +cleanup_tables=0
> cleanup_table=0
> 
> Otherwise it fails:
> nft01 1 TCONF: 'nft' not found
> /opt/ltp/testcases/bin/nft01.sh: line 37: [: -eq: unary operator expected> 
> + nit (code style comments, feel free to ignore):
> 
> 1) I'd use empty variable instead of 0 (and [ "$cleanup_chain" = 1 ]),
> we discuss it with previous patches.
> 
> 2) I'd move TST_CNT=6 to iptables_lib.sh (if test function adds more tests, all
> iptables_lib.sh uses would have to update it). Maybe all but these could be
> there: TST_SETUP, TST_CLEANUP and use_iptables.
> 
> 3) I'd move cleanup_table and cleanup_chain below use_iptables
> (or use_iptables below, just to have all 3 variables together).

Thanks Petr! Fixed them and applied the patches.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
