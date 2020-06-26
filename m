Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CAB20AC5C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:29:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 842EA3C2B6D
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:29:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 37DA83C2B62
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:29:33 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 21074600C34
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:28:36 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05Q6HxaW124942;
 Fri, 26 Jun 2020 06:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2020-01-29;
 bh=gJEmTeOUT7Y+55Ig2qHtg5JHm9Cyf/3Aohcr6OgTf0I=;
 b=qjFiCU5M3DPwt9YIk+2ECkhhszsNXHz+KI+rUKLh24nun9OCPu2O03fO4b/zM8bmQqEi
 nVBGj5R9QeLRTpWnHOh4pLsPN31C+DCWX99DC3FnQnuhU4hKwcTUvDDgQ/N+Lw/lDo5f
 klh5kgcj5DU5Bhu5vVSdOepKhAf3HAGiA9EjbC6ASDsACcyTYq/uRITt0MRzqwrGPgoH
 t8g46lqcQGWje6ZhSWana8xJ+9oyU2h2DdolFVFFa/0XUov6PJDyXeTFx9Zx20CHibfq
 KIE3M4AHVMeAKqUw9fnIkrcUPG+cL1bBc0YnmUcRrc8TC9IAPDRfkPdLror6gvqT5Wit Xg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 31uustva50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Jun 2020 06:29:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05Q6HSQg097572;
 Fri, 26 Jun 2020 06:27:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 31uurtpw9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 06:27:28 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05Q6RRTl027036;
 Fri, 26 Jun 2020 06:27:27 GMT
Received: from [192.168.1.39] (/91.247.148.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 26 Jun 2020 06:27:27 +0000
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <petr.vorel@suse.com>, ltp@lists.linux.it
References: <20200622070911.16123-1-petr.vorel@suse.com>
 <20200622070911.16123-2-petr.vorel@suse.com>
 <3c3327ea-3132-255c-f853-c5c2d3f3c338@oracle.com>
Message-ID: <746f495c-b079-4ead-147a-ab21bb357464@oracle.com>
Date: Fri, 26 Jun 2020 09:27:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3c3327ea-3132-255c-f853-c5c2d3f3c338@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260045
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260045
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RESENT PATCH 1/5] tst_net.sh: Remove rsh support
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

On 25.06.2020 19:42, Alexey Kodanev wrote:
> On 22.06.2020 10:09, Petr Vorel wrote:
>> From: Petr Vorel <pvorel@suse.cz>
>>
> Hi Petr,
> 
>> rsh is not used nowadays. When was the first network library version
>> added in 18739ff06 (2014), it was a default + and ssh replacement was
>> optional. Netns based single machine testing was added in 5f8ca6cf0
>> (2016). After 6 years it's time to drop legacy rsh.
>>
>> ssh based testing setup requires only RHOST variable, TST_USE_SSH has
>> been removed as unneeded. Also check for ssh in tst_rhost_run().
>>
>> We still keep $LTP_RSH for some of the network stress tests, which has
>> not been ported to tst_net.sh yet.
> 
> But tst_net.sh not used in such tests, so why keeping LTP_RSH there?

Ok, tst_net.sh included in testscripts/network.sh, we could change it
to ssh too:

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 41938b1ac..0e10945da 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -856,7 +856,7 @@ tst_default_max_pkt()
 export RHOST="$RHOST"
 export PASSWD="${PASSWD:-}"
 # Don't use it in new tests, use tst_rhost_run() from tst_net.sh instead.
-export LTP_RSH="${LTP_RSH:-rsh -n}"
+export LTP_RSH="${LTP_RSH:-ssh -nq -l root}"
 
 # Test Links
 # IPV{4,6}_{L,R}HOST can be set with or without prefix (e.g. IP or IP/prefix),

> 
>>
>> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>> ---
>>  testcases/lib/tst_net.sh | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
>> index 806b540cd..1b96b3bf4 100644
>> --- a/testcases/lib/tst_net.sh
>> +++ b/testcases/lib/tst_net.sh
>> @@ -136,7 +136,7 @@ init_ltp_netspace()
>>  # -b run in background
>>  # -c CMD specify command to run (this must be binary, not shell builtin/function)
>>  # -s safe option, if something goes wrong, will exit with TBROK
>> -# -u USER for ssh/rsh (default root)
>> +# -u USER for ssh (default root)
>>  # RETURN: 0 on success, 1 on failure
>>  tst_rhost_run()
>>  {
>> @@ -166,14 +166,12 @@ tst_rhost_run()
>>  		return 1
>>  	fi
>>  
>> -	if [ -n "${TST_USE_SSH:-}" ]; then
>> -		output=`ssh -n -q $user@$RHOST "sh -c \
>> -			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
>> -	elif [ -n "${TST_USE_NETNS:-}" ]; then
>> +	if [ -n "${TST_USE_NETNS:-}" ]; then
>>  		output=`$LTP_NETNS sh -c \
>>  			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
>>  	else
>> -		output=`rsh -n -l $user $RHOST "sh -c \
>> +		tst_require_cmds ssh
>> +		output=`ssh -n -q $user@$RHOST "sh -c \
>>  			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
>>  	fi
>>  	echo "$output" | grep -q 'RTERR$' && ret=1
>>
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
