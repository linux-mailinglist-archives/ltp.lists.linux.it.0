Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3648D1FCF8E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 16:30:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5F763C2CB5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 16:30:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E1A523C0731
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 16:30:46 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 275D16009B6
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 16:29:57 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05HELlhh078740;
 Wed, 17 Jun 2020 14:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=qBXDxdLkerV7xmTRwv82C4BSkRC109FDALT3unr1YjE=;
 b=s2bZ1Vwa2bLVJrFEpvGuKAVSCDjE46+d4bBCjYkAmkm/SsQ1GWSVFVzQiPyjdCUCRJrU
 U5SkWPjIKnelwCtNDox+hs/0od3DT4wVOELUvgWt8V6OhLD+jv30j9xZOuO3MhrvC2al
 wgUdr+00Ww6mTGuI0lgTahwSdHEkmT9h49AMfnbul+klaBTTOw9WnDLQMLJVQw33vb6h
 KJmvy670y9/fPnBhYOt4zER7dq00VPEb9WMpJqrYfDxPe1JovKSqJ8O2rH4BA0mvXePu
 n/gLROlSmZrRDNkyhnFRq1woZBxpTpBWrDscaThtzlEhJ4qFk+FqNVz0EE5MOj+FohN7 tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 31q65yun0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jun 2020 14:30:38 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05HEN9XE075581;
 Wed, 17 Jun 2020 14:28:37 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 31q66n803g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jun 2020 14:28:37 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05HESUgl022060;
 Wed, 17 Jun 2020 14:28:35 GMT
Received: from [192.168.1.39] (/91.247.148.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 17 Jun 2020 07:28:30 -0700
To: Petr Vorel <pvorel@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20200608142744.274287-1-yangx.jy@cn.fujitsu.com>
 <20200608145831.GA2746544@x230>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <423c55db-a393-d1d9-6de6-28f65f76557a@oracle.com>
Date: Wed, 17 Jun 2020 17:28:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608145831.GA2746544@x230>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9654
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006170112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9654
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 impostorscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006170112
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nfs_lib.sh: Use double quotes for grep
 pattern
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

On 08.06.2020 17:58, Petr Vorel wrote:
> Hi Xiao,
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Applied the patch, thanks!

> 
>> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
>> @@ -58,7 +58,7 @@ nfs_server_udp_enabled()
>>  	tst_rhost_run -c "[ -f /etc/nfs.conf ]" || return 0
>>  	config=$(tst_rhost_run -c 'for f in $(grep ^include.*= '/etc/nfs.conf' | cut -d = -f2); do [ -f $f ] && printf "$f "; done')
> 
>> -	tst_rhost_run -c "grep -q '^[# ]*udp *= *y' /etc/nfs.conf $config"
>> +	tst_rhost_run -c "grep -q \"^[# ]*udp *= *y\" /etc/nfs.conf $config"
> Good catch. But I wonder if we shouldn't fix tst_rhost_run instead, to avoid
> this error in the future. How about replacing ' with \" in $cmd?
> 

Perhaps this:

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 59b373e..9c8f163 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -172,8 +172,7 @@ tst_rhost_run()
        local output=
        local ret=0
        if [ -n "${TST_USE_SSH:-}" ]; then
-               output=`ssh -n -q $user@$RHOST "sh -c \
-                       '$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
+               output=$(ssh -n -q $user@$RHOST "$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
        elif [ -n "$TST_USE_NETNS" ]; then
                output=`$LTP_NETNS sh -c \
                        "$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
