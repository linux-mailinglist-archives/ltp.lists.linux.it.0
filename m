Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09B10C967
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 14:24:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B295C3C226D
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 14:24:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 650183C1815
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 14:24:01 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0F2BC2010A8
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 14:24:00 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xASDNwvp079970;
 Thu, 28 Nov 2019 13:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=sxMPe4CqKl8mFXnLu5DCSgj6WG0ebQ+6Y0MvLR6hI9M=;
 b=VKIZztkkPIFDmLN8MqyH2Pr+a0DBWJz8k8i1+RPi9gHcrQDMecDmsMVD/IY7Z6TCeGyL
 /qa+63KyMJYK3OCfdBUucgy+e+U2TOJ9hLTdCfsJdaMyaU33DiXZoPTRRa64omnlT87R
 ElWTpOyt+ZofNtUgntMAqL2bpSmO/X+7i+2tlPmcVtt/ZA88Vglwumuxwl+3mbstzZLq
 ebcoBw4zalAlAoZ+9MY9/TxQbvsn1RuP+1A/z1GP51DW7oEAHEZyipltB9x+UH1oUVuG
 Vp1TiZWqeOyM3i1NreEI4yQGPzw5+16F6BdIz22xzYun484mxszspFkGuYKM3OFIwuKE xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2wewdrkh9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Nov 2019 13:23:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xASDHqXd062204;
 Thu, 28 Nov 2019 13:23:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2whx5sanne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Nov 2019 13:23:55 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xASDNroB015391;
 Thu, 28 Nov 2019 13:23:55 GMT
Received: from [192.168.1.49] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 28 Nov 2019 05:23:53 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191126115344.15926-1-alexey.kodanev@oracle.com>
 <20191126115344.15926-2-alexey.kodanev@oracle.com>
 <20191128104603.GA3216@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <81a49496-28c9-2057-7366-8e4d8665644b@oracle.com>
Date: Thu, 28 Nov 2019 16:23:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128104603.GA3216@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9454
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911280118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9454
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911280119
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] network/iptables: add new test for
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

Hi Petr,
On 28.11.2019 13:46, Petr Vorel wrote:
> Hi Alexey,
> 
>> * Reuse the test-cases from iptables_tests by moving them
>>   into iptables_lib.sh.
> 
>> * create nft rules with iptables-translate.
> 
>> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> 
> Thanks for your patch.
> Rewrite is ok, I'd just also drop dots from messages.
> 
> Also redirection to tst_iptables.out in cleanup() is pointless,
> maybe we could just change:
> 
> cleanup()
> {
> 	if lsmod | grep -q "ip_tables"; then
> 		NFRUN -F -t filter > /dev/null 2>&1
> 		NFRUN -F -t nat > /dev/null 2>&1
> 		NFRUN -F -t mangle > /dev/null 2>&1
> 		rmmod -v ipt_limit ipt_multiport ipt_LOG ipt_REJECT \
> 			 iptable_mangle iptable_nat ip_conntrack \
> 			 iptable_filter ip_tables nf_nat_ipv4 nf_nat \
> 			 nf_log_ipv4 nf_log_common nf_reject_ipv4 \
> 			 nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack \
> 			 > /dev/null 2>&1
> 	fi
> }
> 
> For further work on iptables tests: I wonder if nc is more commonly installed in
> distros than telnet (if yes, I'd be for using it).
> 

Agree.

> But for nft01.sh I got error:
> 
> nft01 1 TINFO: INIT: Flushing all rules.
> nft01 1 TCONF: nft not applicable for test 1
> nft01 2 TINFO: Use nft to DROP packets from particular IP
> nft01 2 TINFO: Rule to block icmp from 127.0.0.1
> nft01 2 TFAIL: nft command failed to append new rule.
> Error: Could not process rule: No such file or directory
> add rule ip filter INPUT ip protocol icmp ip saddr 127.0.0.1 counter drop
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It seems there is no ip filter table with INPUT chain? firewalld not installed?

Is it test running fine after these:

# nft add table ip filter
# nft add chain ip filter INPUT '{ type filter hook input priority 0; }'


> nft01 3 TINFO: Use nft to REJECT ping request.
> nft01 3 TINFO: Rule to reject ping request.
> nft01 3 TFAIL: nft command failed to append new rule.
> Error: Could not process rule: No such file or directory
> add rule ip filter INPUT ip daddr 127.0.0.1 icmp type echo-request counter reject
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> nft01 4 TINFO: Use nft to log packets to particular port.
> nft01 4 TINFO: Rule to log tcp packets to particular port.
> nft01 4 TFAIL: nft command failed to append new rule.
> Error: Could not process rule: No such file or directory
> add rule ip filter INPUT ip daddr 127.0.0.1 tcp dport 45886 counter log prefix "1128114107:"
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> nft01 5 TINFO: Use nft to log packets to multiple ports.
> nft01 5 TINFO: Rule to log tcp packets to port 45801 - 45803.
> nft01 5 TFAIL: nft command failed to append new rule.
> Error: Could not process rule: No such file or directory
> add rule ip filter INPUT ip daddr 127.0.0.1 tcp dport 45801-45803 counter log prefix "1128114107:"
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> nft01 6 TINFO: Use nft to log ping request with limited rate.
> nft01 6 TINFO: Rule to log ping request.
> nft01 6 TFAIL: nft command failed to append new rule.
> Error: Could not process rule: No such file or directory
> add rule ip filter INPUT ip daddr 127.0.0.1 icmp type echo-request limit rate 3/hour burst 5 packets counter log prefix "1128114107:"
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Tested on openSUSE Tumbleweed (5.3.8-1-default, nftables v0.9.2 (Scram),
> iptables v1.8.3 (legacy)) and Debian unstable (5.2.0-rc3+, nftables v0.9.0 (Fearless Fosdick), iptables v1.8.2 (nf_tables)). Am I missing something, have wrong version?
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
