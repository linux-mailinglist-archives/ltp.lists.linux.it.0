Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E44B184877
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 14:50:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 815493C58F6
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 14:50:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 374073C58ED
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 14:50:53 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 12E3C14017C5
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 14:50:52 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02DDmUJi104085;
 Fri, 13 Mar 2020 13:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=c9AvSS06+2gtRNY82aLz5Ruki4+vD/XawEqmnskVkG0=;
 b=j9bx3mnr2j7aX2oTjhAtx/BgZRi5eQTSoqp8tUnOU+RCt+KiPR9nCcWjw1RWlhW6l8Jv
 YFxRjVELR8qa+f4hk1kcWFMsIIIbeAK4LuD8gVUbNxC+YjRmTwM+c9CCpnwP9Yr73BU1
 L5bEzdlQqJ5IelENAm+MENyeACx9/oHP+XPDyvaMq+ZtviTaUdAy+Qk1/zudiYq56HcI
 XWjgF4sA1jHe3uICeAR4j+OucgRkdvm5x9WFmIKp5afUpI1inXkVL28RrGoPR5huiRZl
 uX7i0pR7UOB/mQF0O8CzobW3K9gCq5yjcwonuufI9/13wN+eq6TNvPrVW24+24BkgmHd Lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2yqtaeuxcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Mar 2020 13:50:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02DDoGjZ150300;
 Fri, 13 Mar 2020 13:50:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2yqtab758d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Mar 2020 13:50:50 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02DDon9B021705;
 Fri, 13 Mar 2020 13:50:49 GMT
Received: from [192.168.1.34] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Mar 2020 06:50:48 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200311175011.12171-1-pvorel@suse.cz>
 <20200311175011.12171-3-pvorel@suse.cz> <20200311185638.GA12912@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <46684b2a-2e35-8750-bddf-62ba199fcc9f@oracle.com>
Date: Fri, 13 Mar 2020 16:50:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311185638.GA12912@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9558
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003130072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9558
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003130072
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] nfs_lib: Add option to run traffic via lo
 on netns
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11.03.2020 21:56, Petr Vorel wrote:
> Hi Alexey,
> 
> ...
>> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> ...
>> +# When set and test is using netns ($TST_USE_NETNS set) NFS traffic will go
>> +# through lo interface instead of ltp_ns_veth* netns interfaces (useful for
>> +# debugging whether test failures are related to veth/netns).
>> +LTP_NFS_NETNS_USE_LO=
> Sorry, this needs to be
> LTP_NFS_NETNS_USE_LO=${LTP_NFS_NETNS_USE_LO:-}
> 
> + suggest different name, if you don't like this.
> 
> Kind regards,
> Petr
> 

Hi Petr, the patch-series LGTM,

Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
